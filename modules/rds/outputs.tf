output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.db.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.db.id
}
