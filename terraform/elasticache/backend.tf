terraform {
  backend "s3" {
    bucket = "ot-bp-tf-states"
    key = "elasticache/terraform.tfstate"
    region = "us-east-1"
  }
}
