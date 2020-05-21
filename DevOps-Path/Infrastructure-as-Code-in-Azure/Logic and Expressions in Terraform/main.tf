provider "azurerm" {
    version = "2.0.0"
    subscription_id = var.subscriptionID

    features {}
}

resource "azurerm_resource_group" "CBTDevRG" {
    name = var.resourceGroupName
    location = var.location

    provisioner "local-exec" {
      command = "sleep 60"
    }
  }

resource "azurerm_network_security_group" "CBTDevSG" {
  name                = "CBTDevSG"
  location            = "eastus"
  resource_group_name = var.resourceGroupName
  depends_on          = [azurerm_resource_group.CBTDevRG]
}

resource "azurerm_network_security_rule" "Port80" {
  name                        = "Allow80"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.CBTDevSG.resource_group_name
  network_security_group_name = azurerm_network_security_group.CBTDevSG.name
}

resource "azurerm_network_security_rule" "Port22" {
  name                        = "Allow22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.CBTDevSG.resource_group_name
  network_security_group_name = azurerm_network_security_group.CBTDevSG.name
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

resource "azurerm_subnet" "CBTDev-sub" {
  name                 = join(azurerm_virtual_network.CBTDev-vnet.name, ["sub"])
  resource_group_name  = azurerm_network_security_group.CBTDevSG.resource_group_name
  virtual_network_name = azurerm_virtual_network.CBTDev-vnet.name
  address_prefix = "10.0.1.0/24"
}

resource "azurerm_public_ip" "CBTDev-publicIP" {
  name                = join(azurerm_virtual_network.CBTDev-vnet.name, ["pubip"])
  location            = "eastus"
  resource_group_name = azurerm_network_security_group.CBTDevSG.resource_group_name
  allocation_method   = "Static"
  ip_version          = "IPv4"

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_network_interface" "VMInterface" {
  name                = "MVInterface"
  location            = azurerm_network_security_group.CBTDevSG.location
  resource_group_name = azurerm_network_security_group.CBTDevSG.resource_group_name

  ip_configuration {
    name                          = "DevConfig1"
    subnet_id                     = azurerm_subnet.CBTDev-sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.CBTDev-publicIP.id}"
  }

  tags = {
    environment = "staging"
  }
}

output "output_rg" {
  value = [for i in azurerm_network_interface.VMInterface : i]
}

output "dns_servers" {
  value = azurerm_virtual_network.CBTDev-vnet.dns_servers[0]
}