provider "azurerm" {
  version = "~> 1.35"
}

module "azure-core" {
    source = "../modules/azure/core"
    env = "stage"
    instance_count = "4"
}