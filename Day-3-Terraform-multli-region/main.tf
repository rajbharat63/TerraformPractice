#Created 2 aws profiles.
#aws configure --profile prod_user
#aws configure --profile test_user

#Creating EC2 for us-east-2 using test_user, 

resource "aws_instance" "test" {
    ami = var.ami_id
    instance_type = var.instance_type_test
    provider = aws.test
    tags = {
      "Name" = "test-instance"
    }
}

#Creating EC2 for us-east-1 using prod_user, 
resource "aws_instance" "prod" {
    ami = var.ami_id
    instance_type = var.instance_type_prod
    provider = aws.prod
    tags = {
      "Name" = "prod-instance"    
    }
}