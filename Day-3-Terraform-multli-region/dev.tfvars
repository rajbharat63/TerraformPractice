#ami_id = "ami-02dfbd4ff395f2a1b"
#instance_type_test = "t2.micro"
#instance_type_prod = "t2.medium"

#when we are providing terraform.tfvars default file terraform plan and apply would work
#main.tf would reach variables.tf --> terraform.tfvars and fetch the string values

#Here we have cust vars name is provided then,
#terraform plan -var-file="dev.tfvars"
#terraform apply -var-file="dev.tfvars"
#main.tf --> variables.tf --> dev.tfvars



#To destroy resource
#terraform destroy -var-file="dev.tfvars"