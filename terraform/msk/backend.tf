terraform {
  backend "s3" {
    bucket = "bp-cloud-infra"
    key = "elasticache/terraform.tfstate"
    region = "us-east-2"
  }
}


