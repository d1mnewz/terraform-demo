provider "azurerm" {
  version = "~> 1.35"
}

module "azure-core" {
    source = "../modules/azure/core"
    env = "dev"
    instance_count = "3"
}