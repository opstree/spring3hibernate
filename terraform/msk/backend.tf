terraform {
  backend "s3" {
    bucket = "bp-step-tfstate"
    key = "msk/terraform.tfstate"
    region = "us-west-2"
  }
}