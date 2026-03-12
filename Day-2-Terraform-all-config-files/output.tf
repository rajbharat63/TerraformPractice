output "public_ip_dev-instance" {
    value = aws_instance.dev-instance.public_ip
}

output "private_ip" {
    value = aws_instance.test.private_ip
  
}  

output "availability_zone" {
    value = aws_instance.dev-instance.availability_zone
  
}

output "public_ip_test" {
    value = aws_instance.test.public_ip  
}