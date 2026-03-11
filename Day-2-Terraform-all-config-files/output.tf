output "public_ip" {
    value = aws_instance.dev.public_ip
  
}

output "private_ip" {
    value = aws_instance.test.private_ip
  
}  

output "availability_zone" {
    value = aws_instance.dev.availability_zone
  
}