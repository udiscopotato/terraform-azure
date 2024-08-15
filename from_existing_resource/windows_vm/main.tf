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
    storage_account_name = "demostoragge399"
    container_name       = "tfstates"
    key                  = "subham-demo.tfstate"
  }
}

resource "azurerm_resource_group" "resource_group" {
  name       = var.resource_group_name
  location   = var.resource_group_location
  managed_by = null
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_range
  location            = var.virtual_network_location
  resource_group_name = var.virtual_network_rg
}

resource "azurerm_subnet" "virtual_subnet" {
  name                 = var.virtual_subnet_name
  resource_group_name  = var.virtual_network_rg
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.virtual_subnet_address_prefixes
}

resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface_name
  location            = var.virtual_network_interface_loctaion
  resource_group_name = var.virtual_network_interface_rg

  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
    subnet_id                     = var.subnet_id
    private_ip_address_version    = "IPv4"
  }
}

resource "azurerm_managed_disk" "os_disk" {
  name                       = var.os_disk_name
  resource_group_name        = var.os_disk_resource_group_name
  location                   = var.os_disk_location
  storage_account_type       = var.storage_account_type
  create_option              = var.os_disk_create_option
  image_reference_id         = var.os_disk_image_reference_id
  hyper_v_generation         = var.hyper_v_generation
  os_type                    = var.os_type
  on_demand_bursting_enabled = var.on_demand_bursting_enabled
  trusted_launch_enabled     = var.trusted_launch_enabled
#   upload_size_bytes          = 0
}

resource "azurerm_managed_disk" "data_disk" {
  name                 = var.data_disk_name
  resource_group_name  = var.data_disk_resource_group_name
  location             = var.data_disk_location
  storage_account_type = var.data_disk_storage_account_type
  create_option        = var.data_disk_create_option
  disk_size_gb         = 10
}

resource "azurerm_managed_disk" "disk" {
  name                 = var.disk_name
  resource_group_name  = var.disk_resource_group_name
  location             = var.disk_location
  storage_account_type = var.disk_storage_account_type
  create_option        = var.disk_create_option
  disk_size_gb         = 32
}

resource "azurerm_virtual_machine" "vm" {
  name                         = var.vm_name
  location                     = var.vm_location
  resource_group_name          = var.vm_resource_group_name
  network_interface_ids        = [var.vm_network_interface_id]
  primary_network_interface_id = var.vm_network_interface_id
  vm_size                      = var.vm_size

  boot_diagnostics {
    enabled     = true
    storage_uri = ""
  }
  tags                             = {}
  zones                            = []
#   delete_data_disks_on_termination = false
#   delete_os_disk_on_termination    = false
  license_type                     = null

  storage_os_disk {
    name                      = var.os_disk_name
    caching                   = "ReadWrite"
    create_option             = "FromImage"
    managed_disk_id           = var.os_disk_managed_disk_id
    os_type                   = "Windows" 
    managed_disk_type         = var.os_disk_type
    write_accelerator_enabled = false
    disk_size_gb              = 127
    image_uri                 = ""
  }
 
  storage_image_reference {
    id        = null
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }

  storage_data_disk {
    name                      = var.data_disk_name
    caching                   = "None"
    create_option             = "Attach"
    managed_disk_id           = var.data_disk_managed_disk_id
    lun                       = 0
    write_accelerator_enabled = false
    managed_disk_type         = var.data_disk_type
    # disk_size_gb              = 10
  }

  storage_data_disk {
    name                      = var.disk_name
    caching                   = "None"
    create_option             = "Attach"
    managed_disk_id           = var.disk_managed_disk_id
    lun                       = 1
    write_accelerator_enabled = false
    managed_disk_type         = "Standard_LRS"
  }

  os_profile {
    # admin_password = var.admin_password
    admin_username = "subham"
    computer_name  = var.os_profile_computer_name
    custom_data    = ""
  }

  os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = true
  }

#   additional_capabilities {
#     ultra_ssd_enabled = false
#   }

}
