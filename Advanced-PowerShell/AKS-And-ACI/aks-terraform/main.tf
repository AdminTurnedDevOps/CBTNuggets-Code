terraform {
  backend "azurerm" {
    resource_group_name  = "CBTAzure"
    storage_account_name = "cbtstorage19921"
    container_name       = "cbtcontainer"
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

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  addon_profile {
    aci_connector_linux {
      enabled = true
    }
  }

  #    addon_profile {
  #        oms_agent {
  #        enabled                    = true
  #       }
  #    }

  service_principal {
    client_id     = "${data.azurerm_key_vault_secret.keyVaultClientID.value}"
    client_secret = "${data.azurerm_key_vault_secret.keyVaultClientSecret.value}"
  }

  tags = {
    Environment = "Development"
  }
}
