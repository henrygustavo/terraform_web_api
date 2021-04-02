# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

#Definimos el resource group a crear
resource "azurerm_resource_group" "resource_group_test" {
  name     = "TFRecetasDevOpsAppServiceRG"
  location = "West Europe"
}

#Definimos el service plan a crear
resource "azurerm_app_service_plan" "app_service_test" {
  name                = "recetasdevopsserviceplan"
  location            = azurerm_resource_group.resource_group_test.location
  resource_group_name = azurerm_resource_group.resource_group_test.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

#Definimos el app service a crear
resource "azurerm_app_service" "web-app" {
  name                = "recetasdevopsterraform"
  location            = azurerm_resource_group.resource_group_test.location
  resource_group_name = azurerm_resource_group.resource_group_test.name
  app_service_plan_id = azurerm_app_service_plan.app_service_test.id

  app_settings = {
    "ApiUrl" = "www.google.es",
    "Version" = "1.0"
  }
}