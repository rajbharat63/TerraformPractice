resource "aws_vpc" "test-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "TEST-VPC" 
    }
  
}

 resource "aws_instance" "name" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.medium"

    tags = {
      Name = "prod-instance"
    }
   
 }


 resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "UAT-VPC" 
    }
  
}