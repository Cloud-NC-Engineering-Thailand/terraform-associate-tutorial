output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "security_groups" {
  value = [aws_instance.example.vpc_security_group_ids]
}
