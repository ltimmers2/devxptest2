resource "azurerm_storage_account" "innovationday" {
  name                     = "stinnovationday"
  resource_group_name      = azurerm_resource_group.innovationday.name
  location                 = azurerm_resource_group.innovationday.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}