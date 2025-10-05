output "db_connection_url" {
  value = "jdbc:postgresql://${aws_db_instance.rds.address}:${aws_db_instance.rds.port}/${aws_db_instance.rds.db_name}"
}

output "db_host_address" {
  value = aws_db_instance.rds.address
}

output "db_port" {
  value = aws_db_instance.rds.port
}

output "db_name" {
  value = aws_db_instance.rds.db_name
}

output "db_username" {
  value = aws_db_instance.rds.username
}

output "db_password" {
  value     = aws_db_instance.rds.password
  sensitive = true
}