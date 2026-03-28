terraform {
  backend "s3" {
    bucket = "raj20567"
    key    = "Day1/terraform.tfstate"
    region = "us-east-1"
  }
}