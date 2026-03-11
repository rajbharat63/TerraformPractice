#Creating a basic EC2 instance

#creating a resource instance so aws_instance should be provided. Instance name "dev".
resource "aws_instance" "dev" {               
    #ami id we are getting from variables.tf
    ami =  var.ami_id
    #instance type we are getting from the variable.tf file
    instance_type = var.instance_type
    #name
    tags = {
      Name = "dev-instance"
    } 
}

resource "aws_instance" "test" {
    ami =  var.ami_id
    instance_type = var.instance_type
    #vpc_security_group_ids = [ aws_security_group.name.id ]
    tags = {
      Name = "test-instance"
    } 
}



#resource "aws_security_group" "name" {
 #   name = "dev-sg"
  #  description = "Security group for dev instance"
   # vpc_id = aws_vpc.name.id

#    ingress = {
 #       from_port = 22
  #      to_port = 22
   #     protocol = "tcp"
    #    cidr_blocks ["0.0.0.0/0"]
   # }
  
#}