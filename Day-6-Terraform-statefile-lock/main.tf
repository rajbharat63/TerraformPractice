resource "aws_vpc" "vpc_new" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "production"
    }
}

resource "aws_instance" "test" {
    ami =  "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
      Name = "test-instance"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc_new.id
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "public subnet"
    }
  
}