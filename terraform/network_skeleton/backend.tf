terraform {
  backend "s3" {
    bucket = "bp-step-tfstate"
    key = "network/terraform.tfstate"
    region = "us-west-2"
  }
}
