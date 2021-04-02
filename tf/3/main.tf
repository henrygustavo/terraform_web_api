resource "azurerm_resource_group" "rg" {
  name     = var.resource-group-name
  location = var.location-name
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "rg" {
  name                = var.key-vault-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get", "list", "create", "delete", "update",
    ]
    secret_permissions = [
      "get", "list", "set", "delete",
    ]
  }
}

resource "azurerm_key_vault_secret" "rg" {
  name         = var.secret-name
  value        = var.secret-value
  key_vault_id = azurerm_key_vault.rg.id
}

resource "azurerm_storage_account" "rg" {
  name                     = var.storage-name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}