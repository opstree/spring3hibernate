output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "pub_route_table_id" {
  description = "Public route table ID"
  value       = module.publicRouteTable.*.id
}

output "pvt_route_table_id" {
  description = "Private Route table ID"
  value       = module.privateRouteTable.*.id
}

output "pvt_hosted_zone_id" {
  description = "hosted zone id"
  value       = aws_route53_zone.private_hosted_zone.*.zone_id
}

output "pvt_subnet_ids" {
  value = module.PrivateSubnets.*.ids
}

output "public_subnet_ids" {
  value = module.PublicSubnets.*.ids
}

output "web_sg_id" {
  value = module.public_web_security_group.*.sg_id
}

output "dns_name" {
  description = "DNS of ALB"
  value       = module.pub_alb.*.alb_dns_name
}

output "aws_lb_arn" {
  description = "ARN of alb"
  value       = module.pub_alb.*.alb_arn
}

output "alb_listener_arn" {
  description = "ARN of alb listener"
  value       = module.pub_alb.*.alb_http_listener_arn
}

output "alb_listener1_arn" {
  description = "ARN of alb listener-1"
  value       = module.pub_alb.*.alb_https_listener_arn
}

output "route53_zone_id" {
  value = aws_route53_zone.private_hosted_zone.*.id
}

output "route53_name" {
  value = aws_route53_zone.private_hosted_zone.*.name
}