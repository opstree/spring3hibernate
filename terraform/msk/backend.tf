terraform {
  backend "s3" {
    bucket = "bp-infra"
    key = "elasticache/terraform.tfstate"
    region = "us-west-2"
  }
}
