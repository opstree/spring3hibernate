terraform {
  backend "s3" {
    bucket = "ot-bp-tf-states"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}

