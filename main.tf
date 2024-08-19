provider "azurerm" {
  features {}
}

variable "storage_acc_name" {
  type = string
  default = "jenapila399dest"
}
variable "container_name" {
  type = string
  default = "snapshots"
}

variable "vhd_name" {
  type = string
  default = "os_disk_image_second"
}

resource "null_resource" "copy_snapshot" {
  provisioner "local-exec" {
    command = <<EOT
$SnapshotResourceGroup = "TerraformRg"
$SnapshotName = "osdisk-snapshot"
$StorageAccount = "jenapila399dest"
$StorageAccountBlob = "snapshots"
$storageaccountResourceGroup = "TerraformRg"
$vhdname = "${var.vhd_name}"

$StorageAccountKey = (Get-AzStorageAccountKey -Name $StorageAccount -ResourceGroupName $StorageAccountResourceGroup).value[0]
$snapshot = Get-AzSnapshot -ResourceGroupName $SnapshotResourceGroup -SnapshotName $SnapshotName
$snapshotaccess = Grant-AzSnapshotAccess -ResourceGroupName $SnapshotResourceGroup -SnapshotName $SnapshotName -DurationInSecond 3600 -Access Read -ErrorAction stop    
$DestStorageContext = New-AzStorageContext –StorageAccountName $storageaccount -StorageAccountKey $StorageAccountKey -ErrorAction stop

Write-Output "START COPY"
Start-AzStorageBlobCopy -AbsoluteUri $snapshotaccess.AccessSAS -DestContainer $StorageAccountBlob -DestContext $DestStorageContext -DestBlob "$($vhdname).vhd" -Force -ErrorAction stop
Write-Output "END COPY"
EOT
  }
}

resource "azurerm_snapshot" "destination_snapshot" {
  name                = "os_snapshot-copy-v2"
  resource_group_name = "TerraformRg"
  location            = "East US"
  create_option       = "Import"
  storage_account_id  = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/TerraformRg/providers/Microsoft.Storage/storageAccounts/jenapila399dest"
  source_uri          = "https://${var.storage_acc_name}.blob.core.windows.net/${var.container_name}/${var.vhd_name}.vhd"

  depends_on = [null_resource.copy_snapshot]
}