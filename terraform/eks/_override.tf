locals {
  vpc_id = "${data.terraform_remote_state.network.outputs.vpc_id}"
  eks_subnets = "${data.terraform_remote_state.network.outputs.public_subnet_ids}"
  subnets = "${data.terraform_remote_state.network.outputs.pvt_subnet_ids}"
}