#Dummy code from terraform registry https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"
  key_name      = "user1"
  monitoring    = false
  subnet_id     = "subnet-089176f6237d365cc"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}