terraform {
  backend "s3" {
    bucket = "bp-step-tfstate"
    key = "elasticache/terraform.tfstate"
    region = "us-west-2"
  }
}
