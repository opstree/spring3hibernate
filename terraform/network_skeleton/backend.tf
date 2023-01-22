terraform {
  backend "s3" {
    bucket = "bp-cloud-infra"
    key = "network/terraform.tfstate"
    region = "us-east-2"
  }
}
