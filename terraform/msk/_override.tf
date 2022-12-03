locals {
  vpc_id = "${data.terraform_remote_state.network.outputs.vpc_id}"
  kafka_SG_id = "${data.terraform_remote_state.network.outputs.web_sg_id}"
  subnet_ids = "${data.terraform_remote_state.network.outputs.public_subnet_ids}"
}


