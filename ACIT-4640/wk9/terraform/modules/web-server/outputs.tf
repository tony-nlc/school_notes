output "instance_ip_addr" {
  description = "The public IP address assigned to the main web server instance."
  value       = aws_instance.web.public_ip
}

output "instance_dns" {
  description = "The public DNS name assigned to the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}