provider "aws" {
    region = "us-east-2"
    profile = "test_user"
    alias = "test"
  
}


provider "aws" {
    region = "us-east-1"
    profile = "prod_user"
    alias = "prod"
  
}


