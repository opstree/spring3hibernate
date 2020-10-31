
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "ecs-cluster"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["amazon", "self"]
}

resource "aws_security_group" "ec2-sg" {
  name        = "allow-all-ec2"
  description = "allow all"
  vpc_id      = "${aws_vpc.awsvpc.id}"
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.lb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "lc" {
  name          = "test_ecs"
  image_id      = "${data.aws_ami.amazon_linux.id}"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  iam_instance_profile        = "${aws_iam_instance_profile.ecs-ec2-role.name}"
  key_name                    = "mykeypair"
  security_groups             = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#! /bin/bash
sudo apt-get update
sudo echo ECS_CLUSTER=ecs-cluster >> /etc/ecs/ecs.config
EOF
}

resource "aws_autoscaling_group" "asg" {
  name                      = "test-asg"
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  min_size                  = 1
  max_size                  = 4
  desired_capacity          = 1
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  protect_from_scale_in = true
  lifecycle {
    create_before_destroy = true
  }
}
