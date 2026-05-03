module "rds" {
    
    source = "git::https://github.com/rajbharat63/TerraformPractice.git//Day-10-RDS-module?ref=main" 
    #user your github source
    vpc_cidr = "10.0.0.0/16"

subnets = {
  subnet1 = {
    cidr = "10.0.0.0/24"
    az   = "us-east-1a"
  }
  subnet2 = {
    cidr = "10.0.1.0/24"
    az   = "us-east-1b"
  }
}

db_identifier         = "rds-test"
db_name               = "mydb"
db_instance_class     = "db.t3.micro"
db_allocated_storage  = var.db_allocated_storage
db_username           = var.db_username

#note here db_username is passing value to module variable and var.db_username is decalrined in variables.tf file and value is assigned in terraform.tfvars file
#note here db_allocated_storage is passing the value to the module variable which is from Day-10-RDS-module variable section. 
#and var.db_allocated_storage is passing the value from the local source variables.tf and terraform.tfvars

backup_window      = "02:00-03:00"
maintenance_window = "sun:04:00-sun:05:00"

  
}