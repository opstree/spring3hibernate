locals {
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  eks_subnets = data.terraform_remote_state.network.outputs.public_subnet_ids
  subnets = flatten(data.terraform_remote_state.network.outputs.pvt_subnet_ids)
  node_sg = data.terraform_remote_state.network.outputs.web_sg_id
}