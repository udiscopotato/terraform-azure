provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "demo-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "terraformstorageacc"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstates"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}