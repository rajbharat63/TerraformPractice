terraform {
  backend "s3" {
    bucket = "raj20567"
    key    = "Day2/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true #Dynamo no longer required for state locking in s3 backend we can use lockfile
  }
}

#Without DynamoDB

#Terraform stores the state file in S3, but there is no DynamoDB table for lock management.

#If two people run terraform apply at the same time:

#both may try to update the same state
#state can get corrupted or overwritten
#one person’s changes can clash with the other’s

#So without DynamoDB, the big risk is concurrent update problem.

#With DynamoDB

#Terraform still stores the actual state file in S3.

#But now Terraform also uses a DynamoDB table for state locking and consistency:

#before apply, Terraform writes a lock entry in DynamoDB
#while one user is running apply, another user is blocked
#after apply, the lock is removed

#So with DynamoDB:

#safer for multiple users
#avoids parallel apply issues
#better protection for shared team usage