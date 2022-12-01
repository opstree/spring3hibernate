name = "elasticache-cluster"
#security_group_ids = ["sg-02b42751eab13f53a", "sg-0a80c39996b1d8abc"]
#subnet_ids = ["subnet-06e41801e9618a572", "subnet-020af10ef815e5c07"]
security_group_ids = data.terraform_remote_state.network.outputs.web_sg_id
subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids