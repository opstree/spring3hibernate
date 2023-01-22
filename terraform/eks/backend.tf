terraform {
  backend "s3" {
    bucket = "bp-cloud-infra"
    key = "eks/terraform.tfstate"
    region = "us-east-2"
  }
}

