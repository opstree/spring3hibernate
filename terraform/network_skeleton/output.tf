output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "pub_route_table_id" {
  description = "Public route table ID"
  value       = module.vpc.pub_route_table_id
}

output "pvt_route_table_id" {
  description = "Private Route table ID"
  value       = module.vpc.pvt_route_table_id
}

output "pvt_hosted_zone_id" {
  description = "hosted zone id"
  value       = module.vpc.pvt_hosted_zone_id
}

output "pvt_subnet_ids" {
  value = module.vpc.pvt_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids[0]
}

output "web_sg_id" {
  value = module.vpc.web_sg_id
}

output "dns_name" {
  description = "DNS of ALB"
  value       = module.vpc.dns_name
}

output "aws_lb_arn" {
  description = "ARN of alb"
  value       = module.vpc.aws_lb_arn
}

output "alb_listener_arn" {
  description = "ARN of alb listener"
  value       = module.vpc.alb_listener_arn
}

output "alb_listener1_arn" {
  description = "ARN of alb listener-1"
  value       = module.vpc.alb_listener1_arn
}

output "route53_zone_id" {
  value = module.vpc.route53_zone_id
}

output "route53_name" {
  value = module.vpc.route53_name
}