resource "aws_vpc" "vpc_old" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "old_UAT"
    }
}

resource "aws_instance" "UAT" {
    ami =  "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
      Name = "UAT-instance"
    }
}

resource "aws_subnet" "public2_subnet" {
    vpc_id = aws_vpc.vpc_new.id
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "public2 subnet"
    }
  
}