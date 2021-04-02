terraform {
  backend "azurerm" {
    
  resource_group_name  = "terra-rg-hgfv"
  storage_account_name = "remotesa01hgfv"
  container_name       = "tfstate"
  key                  = "#{env}#.tfstate"

  }
}