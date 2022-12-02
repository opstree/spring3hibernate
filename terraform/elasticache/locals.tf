locals {
  default_security_group_ids = "${data.terraform_remote_state.network.outputs.web_sg_id}"
  default_subnet_ids = "${data.terraform_remote_state.network.outputs.public_subnet_ids}"
}