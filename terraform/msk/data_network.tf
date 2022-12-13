data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket  = "bp-infra"
    key     = "network/terraform.tfstate"
    region  = "us-west-2"
  }
}