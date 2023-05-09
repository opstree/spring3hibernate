data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket  = "ot-bp-tf-states"
    key     = "network/terraform.tfstate"
    region  = "us-east-1"
  }
}
