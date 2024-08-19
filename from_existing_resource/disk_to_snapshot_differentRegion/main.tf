provider "azurerm" {
  features {}
}

data "azurerm_managed_disk" "os_disk" {
  name                = var.source_disk_name
  resource_group_name = var.source_resource_group
}

resource "azurerm_snapshot" "source_snapshot" {
  name                = var.snapshot_name
  resource_group_name = var.source_resource_group
  location            = var.source_region
  create_option       = "Copy"
  source_uri          = data.azurerm_managed_disk.os_disk.id
}

resource "azurerm_storage_account" "snapshot_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.source_resource_group
  location                 = var.source_region
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "snapshot_container" {
  name                  = "snapshots"
  storage_account_name  = azurerm_storage_account.snapshot_storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "exported_snapshot_blob" {
  name                   = "${var.snapshot_name}.vhd"
  storage_account_name   = azurerm_storage_account.snapshot_storage.name
  storage_container_name = azurerm_storage_container.snapshot_container.name
  type                   = "Block"
  source_uri             = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/TerraformRg/providers/Microsoft.Compute/snapshots/osdisk-snapshot"
}

resource "azurerm_storage_account" "destination_storage" {
  name                     = "${var.storage_account_name}dest"
  resource_group_name      = var.destination_resource_group
  location                 = var.destination_region
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "snapshot_container2" {
  name                  = "snapshots"
  storage_account_name  = azurerm_storage_account.destination_storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "copied_snapshot_blob" {
  name                   = "${var.snapshot_name}.vhd"
  storage_account_name   = azurerm_storage_account.destination_storage.name
  storage_container_name = azurerm_storage_container.snapshot_container2.name
  type                   = "Block"
  source_uri             = azurerm_storage_blob.exported_snapshot_blob.id
}

resource "azurerm_snapshot" "destination_snapshot" {
  name                = "${var.snapshot_name}-copy"
  resource_group_name = var.destination_resource_group
  location            = var.destination_region
  create_option       = "Import"
  source_uri          = azurerm_storage_blob.copied_snapshot_blob.url
}