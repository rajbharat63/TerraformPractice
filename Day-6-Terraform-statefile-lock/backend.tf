terraform {
  backend "s3" {
    bucket = "raj20567"
    key    = "Day2/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true #Dynamo no longer required for state locking in s3 backend we can use lockfile
  }
}