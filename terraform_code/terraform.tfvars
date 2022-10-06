region             = "ap-south-1"
vpc_name           = "sonarqube_vpc"
vpc_cidr           = "10.0.0.0/16"
az                 = ["ap-south-1a", "ap-south-1b"]
private_subnets    = ["10.0.3.0/24"]
public_subnets     = ["10.0.1.0/24","10.0.2.0/24"]
enable_nat_gateway = true
public_ec2_type    = "t2.micro"
key_name           = "grafana"
private_ec2_type      = "t2.micro"
default_tags          = { ENV = "sonarqube", Company = "Opstree", Owner = "Neha Sinha" }
public_instance_name  = "bastion"
private_instance_name = "Sonarqube-server"
bastion_sg_name       = "bastion-sg"
private_sg_name       = "Sonarqube-private-sg"
ingress_with_cidr_blocks = [{ from_port = 9000, to_port = 9000, protocol = "tcp", description = "Sonarqube", cidr_blocks = "0.0.0.0/0" },{ from_port = 80, to_port = 80, protocol = "tcp", description = "tcp 80", cidr_blocks = "0.0.0.0/0" }]
ingress_with_cidr_blocks_database = [{ from_port = 9000, to_port = 9000, protocol = "tcp" ,cidr_blocks = "0.0.0.0/0"}]
profile_name          = "kafka_role"
