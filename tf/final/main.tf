resource "azurerm_resource_group" "resource_group" {
  name     = "${var.env}-${var.resource-group-name}"
  location = var.location-name
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key-vault" {
  name                = "${var.env}-${var.key-vault-name}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
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

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.env}${var.storage-name}"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "service_plan" {
  name                = "${var.env}-${var.service-plan}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "web-api" {
  name                = "${var.env}-${var.site-name}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.service_plan.id
}
