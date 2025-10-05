output "db_connection_url" {
  value = module.rds.db_connection_url
}

output "db_host_address" {
  value = module.rds.db_host_address
}

output "db_port" {
  value = module.rds.db_port
}

output "db_name" {
  value = module.rds.db_name
}

output "db_username" {
  value = module.rds.db_username
}

output "db_password" {
  value     = module.rds.db_password
  sensitive = true
}