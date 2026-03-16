#In the first attempt we created VPC with name dev-VPC in NAME(tags). As it is the first time creation without statefile, Terraform creates the VPC
# 1 to add
#In the second attempt we changed the name of the VPC from test-VPC > dev-VPC, 1 to change. (deletes and recreates the VPC as the instances might have created within this subnet so updating the name is not allowed)

resource "aws_vpc" "test-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "dev-VPC" 
    }
  
}

#In the 3rd attempt we are adding new block to create an EC2 instance naming test-instance in tags. State file has VPC already, so 1 to add


 resource "aws_instance" "name" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.medium"
#Created a role, attached to test-instance. 1 to change --> adds updates the state file (IAM role behavior is detach and attach on AWS)
 #   iam_instance_profile = "reattach"
 #performing a modification by changing the iam role name. Update performs to the same instance without terminating the instance
    iam_instance_profile = "dummy"

    tags = {
      Name = " test-instance"
    }
   
 }

# Just trying to create EC2 instance within VPC range of dev-VPC
#Here creating subnet

resource "aws_subnet" "dev-subnet" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "dev-subnet"
    }
#Creating EC2 instance within the range

}
 resource "aws_instance" "dev" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.dev-subnet.id
    tags = {
      Name = " dev-instance"
    }
   
 }


#I have created a IAM ROLE attached to the EC2 instance. And when terraform plan ran, IAM ROLE is not the main.tf code, so terraform state has no indication of ROLE so those changes are not been modified on the instance level.
#terraform plan output below.
#No changes. Your infrastructure matches the configuration.
#Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
#If we do any changes on the remote end for the resource blocks defined in the code level then those would revert back