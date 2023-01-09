## Address URL and PORT
output "db_url" {
  value = aws_db_instance.postgress_database.address  
}
## Storage amount
output "storage_value" {
  value = aws_db_instance.postgress_database.allocated_storage  
}
## Address URL:PORT
output "db_endpoint" {
  value = aws_db_instance.postgress_database.endpoint
}

## IAM
output "iam_role" {
  value = aws_db_instance.postgress_database.domain_iam_role_name
}
## USERNAME
output "db_username" {
  value = aws_db_instance.postgress_database.username
}
## Multi AZs
output "multi_az_check" {
  value = aws_db_instance.postgress_database.multi_az
}
## Backup retention eriod
output "back_retention" {
  value = aws_db_instance.postgress_database.backup_retention_period
}
## DB Subnet group linked subnet IDs
output "db_subnet_group_subnet_ids" {
  value = aws_db_subnet_group.db_subnet_group.subnet_ids
}