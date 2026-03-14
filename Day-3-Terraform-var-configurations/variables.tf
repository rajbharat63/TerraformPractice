variable "ami_id" {
    description = "passing the ami to the variable"
    default = ""
    type = string

}


variable "instance_type_dev" {
    description = "passing the instance type for dev"
    default = ""
    type = string
  
}


variable "instance_type_prod" {
    description = "passing the instance type for prod"
    default = ""
    type = string
  
}