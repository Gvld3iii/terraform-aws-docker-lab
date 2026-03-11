output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.docker_server.public_ip
}

output "app_url" {
  description = "URL for the Docker lab app"
  value       = "http://${aws_instance.docker_server.public_ip}:8000"
}