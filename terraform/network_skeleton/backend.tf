terraform {
  backend "s3" {
    bucket = "ot-bp-tf-states"
    key = "network/terraform.tfstate"
    region = "us-east-2"
  }
}
