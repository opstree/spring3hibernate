variable "name" {
  type        = string
  default     = "elasticache-cluster"
  description = "Name of the cluster"
}
variable "security_group_ids" {
  type        = string
  default     = "${data.terraform_remote_state.network.outputs.web_sg_id}"
  description = "One or more Amazon VPC security groups associated with this replication group. Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud"
}
variable "subnet_ids" {
  type        = list(string)
  default     = "${data.terraform_remote_state.network.outputs.public_subnet_ids}"
  description = "List of VPC Subnet IDs for the cache subnet group"
}