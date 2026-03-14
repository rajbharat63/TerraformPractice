#creating a EC2 instance named dev-instance, this resource name would be dev. In output.tf file we should assign dev as an instance name
resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type_dev
    tags = {
      "Name" = "dev-instance"
    }
}

#Creating a EC2 instance named prod-instance. This resoruce name would be prod. In output.tf file we should assign prod as an instance name
resource "aws_instance" "prod" {
    ami = var.ami_id
    instance_type = var.instance_type_prod
    tags = {
      "Name" = "prod-instance"    
    }
}