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
  backend "azurerm" {
    resource_group_name  = "demo-rg"
    storage_account_name = "terraformstorageacc"
    container_name       = "tfstates"
    key                  = "demo-terraform.tfstate"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "TerraformRg"
  location =  "Central India"
}

resource "azurerm_virtual_network" "main" {
  name                = "terraform-network"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/29"]
}

resource "azurerm_network_interface" "main" {
  name                = "terraform-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "terraform-vm"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = "Central India"
  size                            = "Standard_D2s_v3"
  admin_username                  = "adminuser"
  admin_password                  = "@@12345678"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}