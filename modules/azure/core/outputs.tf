output "database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = ["${azurerm_sql_database.db.*.name}"]
}