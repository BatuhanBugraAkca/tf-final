output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = [aws_instance.web_1.id, aws_instance.web_2.id]
}

output "instance_public_ips" {
  description = "List of public IP addresses of the EC2 instances"
  value       = [aws_instance.web_1.public_ip, aws_instance.web_2.public_ip]
} 