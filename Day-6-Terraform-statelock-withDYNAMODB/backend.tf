terraform {
  backend "s3" {
    bucket = "raj20567"
    key    = "Day3_dynamoDB/terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = true #Enabling S3 native locking, tf version should higher than 1.10
    dynamodb_table = "terraform-state-lock-dynamo" #lockID is required in the partition field
      } 
}

#DynamoDB will take care of the locking system