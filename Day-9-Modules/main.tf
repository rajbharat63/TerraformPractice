#i am passing the values from Day-9-modules folder to Day-2 . 
#So Source code exists in Day-2 folder but we are utilizing the source code from Day2 and generating new resources by the values passing from Day 9 folder

module "dev" {
  source = "../Day-2-Terraform-all-config-files"  # Source will be cloned from Day2
  ami_id = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"

}