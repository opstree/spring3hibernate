terraform {
  backend "s3" {
    bucket = "bp-infra"
    key = "eks/terraform.tfstate"
    region = "us-west-2"
  }
}