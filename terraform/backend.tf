terraform {
  backend "s3" {
    bucket = "ayush-terraform-state"
    region = "us-east-1"
  }
}