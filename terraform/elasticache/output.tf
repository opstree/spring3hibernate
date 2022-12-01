output "arn" {
  value       = module.elasticache.arn
  description = "The Amazon Resource Name (ARN) of the created ElastiCache Replication Group."
}
output "id" {
  value       = module.elasticache.id
  description = "The ID of the ElastiCache Replication Group."
}
output "cluster_enabled" {
  value       = module.elasticache.cluster_enabled
  description = "Indicates if cluster mode is enabled."
}
output "configuration_endpoint_address" {
  value       = module.elasticache.configuration_endpoint_address
  description = "The address of the replication group configuration endpoint when cluster mode is enabled."
}
output "primary_endpoint_address" {
  value       = module.elasticache.primary_endpoint_address
  description = "The address of the endpoint for the primary node in the replication group, if the cluster mode is disabled."
}
output "reader_endpoint_address" {
  value       = module.elasticache.reader_endpoint_address
  description = "The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
}
output "auth_token" {
  value       = module.elasticache.auth_token
  description = "Create a random string"
}
output "subnet_ids" {
  value = data.terraform_remote_state.network.outputs.public_subnet_ids
}
output "security_group_ids" {
 value = data.terraform_remote_state.network.outputs.web_sg_id 
}
