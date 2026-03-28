resource "aws_vpc" "vpc_new" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "production"
    }
}