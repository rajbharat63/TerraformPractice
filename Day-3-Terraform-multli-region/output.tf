output "instance_type_test" {
    value = aws_instance.test.public_ip
}

output "instance_type_prod" {
    value = aws_instance.prod.private_ip
  
}