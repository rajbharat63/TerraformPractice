module "dev" {
    source = "../Day-10-Modules-2-for-EC2"

    name = "dev-ec2"
    ami_id = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"

    tags = {
        Name = "dev-ec2"
        Environment = "dev"
    }
   
} 