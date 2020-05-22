resource "azurerm_resource_group" "CBTDevRG" {
    name = var.resourceGroupName
    location = var.location
}