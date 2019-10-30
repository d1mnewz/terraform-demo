provider "azurerm" {
  version = "~> 1.35"
}

module "azure-core" {
    source = "../modules/azure/core"
    env = "prod"
    instance_count = "5"
}