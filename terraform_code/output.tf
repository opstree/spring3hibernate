output "vpc" {
  value = module.vpc.vpc_id
}


output "sonarqube-bastion-security-group" {
  value = module.sonarqube-bastion-security-group
}

output "sonarqube-private-security-group" {
  value = module.sonarqube-private-security-group
}

output "ec2_instance_private" {
  value = module.ec2_instance_private
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance_public
}

output "ip" {
  value = data.http.ip.body
}
