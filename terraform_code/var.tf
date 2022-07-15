variable "region" {
  type = string
  default     = "ap-south-1"
  description = "Enter the region in which Infra will created"
}

variable "vpc_name" {
  type = string
  default     = "Sonarqube_vpc"
  description = "Enter the VPC name"
}
variable "vpc_cidr" {
  type = string
  default     = "10.0.0.0/16"
  description = "Enter the vpc cidr"
}

variable "bastion_sg_name" {
  type = string
  default     = "Sonarqube-bastion-sg"
  description = "Enter the security group name for bastion"
}

variable "enable_nat_gateway" {
  type = bool
  default     = true
  description = "Enter the value for NAT true/false"
}
variable "az" {
  type = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  description = "Enter the Availability Zones"
}
variable "private_subnets" {
  type = list(string)
  default     = ["10.0.3.0/24"]
  description = "Enter the private subnets cidr"
}

variable "public_subnets" {
  type = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
  description = "Enter the public subnet cidr"
}

variable "public_ec2_type" {
  type = string
   default     = "t2.micro"
  description = "Enter the public ec2 types"
}
variable "key_name" {
  type = string
   default     = "ansiblehost"
  description = "Enter the public instance key name"
}


variable "private_ec2_type" {
  type = string
  default     = "t2.medium"
  description = "Enter the private ec2 types"
}

# variable "ami_id" {
#   type = string
#   default     = "ami-0c1a7f89451184c8b"
#   description = "Enter the ami_id"
# }

variable "default_tags" {
  type = map(any)
  default     = { ENV = "Sonarqube", Owner = "Neha Sinha", company = "Opstree" }
  description = "Enter the tags"
}

variable "public_instance_name" {
  type = string
  default     = "Sonarqube-Bastion"
  description = "Enter the bastion name"
}
variable "private_instance_name" {
  type = string
  default     = "Sonarqube-server"
  description = "Enter the bastion name"
}

variable "private_sg_name" {
  type = string
  default     = "Sonarqube-private-sg"
  description = "Enter the private security group name"
}
locals {
  ip = data.http.ip
}
 
 variable "ingress_with_cidr_blocks" {
type        = list(any)
default     = [{ from_port = 22, to_port = 22, protocol = "tcp", description = "Public Access", cidr_blocks = "0.0.0.0/0" }]
description = "Enter the ports and cidrs you want to open"
}


variable "ingress_with_cidr_blocks_database" {
  type        = list(any)
  default     = [{ from_port = 22, to_port = 22, protocol = "tcp", description = "By Bastion Access", cidr_blocks = "12.0.101.0/24" }]
  description = "Enter the ports and cidrs you want to open"
}
#variable "http_listeners" { 
#type = list(any)
#default = [{ port = 9000, protocol = "HTTP", target_group_index = 0 }]

#}
variable "http_tcp_listeners" {
  type = list(any)
  default = [{ port = 80, protocol = "HTTP", target_group_index = 0 }]
  
}
variable "profile_name" {
  type        = string
  description = "Enter the profile name"
  default     = "sonarquberole"
}
