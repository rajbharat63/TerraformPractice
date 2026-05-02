variable "name" {
  description = "Name of EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "Availability zone to select default subnet"
  type        = string
  default     = "us-east-1a"
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
  default     = null
}

variable "ssh_allowed_cidrs" {
  description = "Allowed CIDR blocks for SSH"
  type        = list(string)
  default     = []
}

variable "http_allowed_cidrs" {
  description = "Allowed CIDR blocks for HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}

variable "user_data" {
  description = "User data script path"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for EC2 and security group"
  type        = map(string)
  default     = {}
}