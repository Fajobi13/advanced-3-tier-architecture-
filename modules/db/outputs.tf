
output "db_instance_id" {
  value = aws_db_instance.rds.id
  description = "The ID of the RDS database instance"
}
