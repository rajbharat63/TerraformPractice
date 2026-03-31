resource "aws_vpc" "vpc_prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "Prod_VPC" 
    }
}


#this is public subnet
resource "aws_subnet" "prod_subnet-1" {
    vpc_id = aws_vpc.vpc_prod.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2a"
    tags = {
      "Name" = "prod_subnet-1" 
    }
    map_public_ip_on_launch = true #means instances launched in this subnet can automatically get a public IP.
  
}

#this is private subnet
resource "aws_subnet" "prod_subnet-2" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.vpc_prod.id
    tags = {
      "Name" = "prod_subnet-2"
    }
    availability_zone = "us-west-2a"
}



resource "aws_internet_gateway" "igw_prod" {
    vpc_id = aws_vpc.vpc_prod.id
    tags = {
        "Name" = "igw_prod"
    }
  
}

resource "aws_route_table" "prod-routetable" {
    vpc_id = aws_vpc.vpc_prod.id
        route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.igw_prod.id
        }
    tags = {
      "Name" = "prod-routetable"
    }
    
}

resource "aws_route_table_association" "prod_routetable_association" {
    subnet_id = aws_subnet.prod_subnet-1.id
    route_table_id = aws_route_table.prod-routetable.id
  
}

#ingress meaning inbound rule and egress meaning outbound rule
resource "aws_security_group" "prod_sg" {
    name = "prod-sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_vpc.vpc_prod.id
    ingress  {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress  {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "bastion" {
    ami = "ami-014d82945a82dfba3"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.prod_subnet-1.id
    vpc_security_group_ids = [aws_security_group.prod_sg.id]
    tags = {
      "Name" = "bastion-instance"
    }
    availability_zone = "us-west-2a"
    associate_public_ip_address = true   #this assigns auto-assign public IP
    
  
}


resource "aws_instance" "private-server" {
    ami = "ami-014d82945a82dfba3"
    instance_type = "t2.medium"
    tags = {
        "Name" = "private-server"

    }
    vpc_security_group_ids = [aws_security_group.prod_sg.id]
    availability_zone = "us-west-2a"
    subnet_id = aws_subnet.prod_subnet-2.id

  
}



