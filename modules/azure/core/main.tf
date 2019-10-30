
# terralith XD
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.env}-rg"
  location = "${var.location}"
  tags = {
    env = "${var.env}"
    module = "azure-core"
  }
}

resource "azurerm_sql_database" "db" {
  name                             = "${var.prefix}-${var.env}-db-${count.index + 1}"
  resource_group_name              = "${azurerm_resource_group.rg.name}"
  location                         = "${var.location}"
  edition                          = "${var.db_edition}"
  collation                        = "${var.collation}"
  server_name                      = "${azurerm_sql_server.server.name}"
  create_mode                      = "Default"
  requested_service_objective_name = "${var.service_objective_name}"
  count                            = "${var.instance_count}"
  tags = {
    env = "${var.env}"
    module = "azure-core"
  }
  
}

resource "azurerm_sql_server" "server" {
  name                         = "${var.prefix}-${var.env}-sql"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${var.location}"
  version                      = "${var.server_version}"
  administrator_login          = "${var.sql_admin_username}"
  administrator_login_password = "${var.sql_password}"
  tags = {
    env = "${var.env}"
    module = "azure-core"
  }
}

resource "azurerm_sql_firewall_rule" "fw" {
  name                = "${var.prefix}-${var.env}-firewall"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.server.name}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}