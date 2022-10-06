provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
 
  
}
data "aws_ami" "java-spring3Hibernateapplication" {
most_recent = true
owners = ["062711695447"] # Canonical

  filter {
      name   = "tag:Name"
      values = ["spring3hibernate-ami-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
    filter {
      name   = "tag:Type"
      values = ["java application"]
  }
}


data "http" "ip" {
  url = "https://ifconfig.me"
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               =    var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.az
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway

}


module "sonarqube-bastion-security-group" {
  source              = "terraform-aws-modules/security-group/aws"
  name                = var.bastion_sg_name
  description         = "Security group for user-service with custom ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = [join("/", [data.http.ip.body, "32"])]
  ingress_rules       = ["ssh-tcp", ]
  egress_rules        = ["all-all"]
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

}

module "ec2_instance_public" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  count                  = length(module.vpc.public_subnets)
  ami                    = data.aws_ami.java-spring3Hibernateapplication.id
  instance_type          = var.public_ec2_type
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sonarqube-bastion-security-group.security_group_id]
  key_name               = var.key_name
  name                   = tostring(join("_", [var.public_instance_name,count.index]))
  iam_instance_profile   = var.profile_name 

 
}


module "sonarqube-private-security-group" {
  source                   = "terraform-aws-modules/security-group/aws"
  vpc_id                   = module.vpc.vpc_id
  ingress_cidr_blocks      = var.public_subnets
  ingress_rules            = ["ssh-tcp"]
  egress_rules             = ["all-all"]
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks_database
  name                     = var.private_sg_name


}

module "ec2_instance_private" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  count                  = length(module.vpc.private_subnets)
  ami                    = data.aws_ami.java-spring3Hibernateapplication.id
  instance_type          = var.private_ec2_type
  subnet_id              = module.vpc.private_subnets[count.index]
  vpc_security_group_ids = [module.sonarqube-private-security-group.security_group_id]
  key_name               = var.key_name
  name                   = tostring(join("_", [var.private_instance_name, count.index]))

}



module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [module.sonarqube-bastion-security-group.security_group_id]
  

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     =  9000
      target_type      = "instance"
      targets = [
        {
          target_id = module.ec2_instance_private[0].id
        }
       
      ]
    }
  ]

  #http_listeners = var.http_listeners
  

  http_tcp_listeners =  var.http_tcp_listeners
    

  tags = { 
    Environment = "Test"
  }
}
