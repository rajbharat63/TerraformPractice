terraform {
  backend "s3" {
    bucket = "raj20567"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}