terraform {
  backend "s3" {
    bucket = "bp-step-tfstate"
    key = "eks/terraform.tfstate"
    region = "us-west-2"
  }
}