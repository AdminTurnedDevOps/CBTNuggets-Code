provider "azurerm" {
  version = "2.0.0"
  features {}
}


resource "azurerm_virtual_machine" "main" {
  count                 = 1
  name                  = "ansiblehost-${count.index}"
  location              = var.location
  resource_group_name   = var.resourceGroup
  network_interface_ids = [var.NIC]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "ansibledisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "ansiblehost01"
    admin_username = "ansible"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/ansible/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }
  tags = {
    environment = "staging"
  }
}
