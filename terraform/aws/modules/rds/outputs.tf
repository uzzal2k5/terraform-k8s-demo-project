output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_instance_id" {
  value = aws_db_instance.postgres.id
}

output "rds_subnet_ids" {
  value = aws_db_subnet_group.rds_subnet_group.id
}