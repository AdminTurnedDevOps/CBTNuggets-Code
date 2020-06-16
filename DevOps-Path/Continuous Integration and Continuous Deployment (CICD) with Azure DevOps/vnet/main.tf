provider "azurerm" {
    version = "2.0.0"
    subscription_id = var.subscriptionID

    features {}
}

resource "azurerm_virtual_network" "CBTDev-vnet" {
  name                = "CBTDev-vnet"
  location            = var.location
  resource_group_name = var.resourceGroupName
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]

  tags = {
    environment = "Dev"
  }
}
