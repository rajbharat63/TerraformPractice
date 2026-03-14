output "instance_type_dev" {
    value = aws_instance.dev.public_ip
}

output "instance_type_prod" {
    value = aws_instance.prod.private_ip
  
}