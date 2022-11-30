output "arn" {
  value       = module.vpc.arn
  description = "The Amazon Resource Name (ARN) of the created ElastiCache Replication Group."
}
output "id" {
  value       = module.vpc.id
  description = "The ID of the ElastiCache Replication Group."
}
output "cluster_enabled" {
  value       = module.vpc.cluster_enabled
  description = "Indicates if cluster mode is enabled."
}
output "configuration_endpoint_address" {
  value       = module.vpc.configuration_endpoint_address
  description = "The address of the replication group configuration endpoint when cluster mode is enabled."
}
output "primary_endpoint_address" {
  value       = module.vpc.primary_endpoint_address
  description = "The address of the endpoint for the primary node in the replication group, if the cluster mode is disabled."
}
output "reader_endpoint_address" {
  value       = module.vpc.reader_endpoint_address
  description = "The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
}
output "auth_token" {
  value       = module.vpc.auth_token
  description = "Create a random string"
}
