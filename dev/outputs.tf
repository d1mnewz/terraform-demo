output "database_n" {
  description = "Database name of the Azure SQL Database created."
  value       = ["${module.azure-core.database_name.*}"]
}
