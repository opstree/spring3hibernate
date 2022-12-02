locals {
  security_group_ids = "${data.terraform_remote_state.network.outputs.web_sg_id}"
}
