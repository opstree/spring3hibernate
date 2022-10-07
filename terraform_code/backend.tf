terraform {
  backend "s3" {
    bucket = "bp-tf-states"
    key    = "env/testing/bp.tfstate"
    region = "ap-south-1"
  }
}
