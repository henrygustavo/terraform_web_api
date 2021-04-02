/*data "azurerm_key_vault" "kv01" {
  name                = var.key-vault-name
  resource_group_name = var.resource-group-name
}

data "azurerm_key_vault_secret" "kv01" {
  name         = var.secret-name
  key_vault_id = data.azurerm_key_vault.kv01.id
}
*/