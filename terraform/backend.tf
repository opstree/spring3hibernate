terraform {
  backend "s3" {
    bucket = "ayushterraform-state"
    region = "us-east-1"
  }
}