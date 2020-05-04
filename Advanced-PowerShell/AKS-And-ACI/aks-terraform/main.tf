terraform {
  backend "azurerm" {
    resource_group_name  = "CBTAzure"
    storage_account_name = "cbtstorage19921"
    container_name       = "tfstate"
    key                  = "terraform.state"
  }
}

provider azurerm {
  version = "2.0.0"
  features {}
}

data "azurerm_key_vault_secret" "keyVaultClientID" {
  name         = "AKSClientID"
  key_vault_id = var.keyvaultID
}

data "azurerm_key_vault_secret" "keyVaultClientSecret" {
  name         = "AKSClientSecret"
  key_vault_id = var.keyvaultID
}

resource "azurerm_kubernetes_cluster" "CBTAKS" {
  name                = var.Name
  location            = var.location
  resource_group_name = var.resourceGroup
  dns_prefix          = "cbtdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  #addon_profile {
  #  aci_connector_linux {
  #    enabled = true
  #    subnet_name = var.subnetName
  #  }
  #}

  service_principal {
    client_id     = "${data.azurerm_key_vault_secret.keyVaultClientID.value}"
    client_secret = "${data.azurerm_key_vault_secret.keyVaultClientSecret.value}"
  }

  tags = {
    Environment = "Development"
  }
}
