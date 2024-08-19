variable "source_resource_group" {
  type        = string
  description = "The name of the resource group containing the OS disk."
  default = "TerraformRg"
}

variable "source_disk_name" {
  type        = string
  description = "The name of the OS disk to be snapshotted."
  default = "testVM-os"
}

variable "destination_resource_group" {
  type        = string
  description = "The name of the resource group in the destination region."
  default = "TerraformRg"
}

variable "source_region" {
  type        = string
  description = "The Azure region where the OS disk is located."
  default = "Central India"
}

variable "destination_region" {
  type        = string
  description = "The Azure region where the snapshot will be copied."
  default = "East US"
}

variable "snapshot_name" {
  type        = string
  description = "The name of the snapshot."
  default     = "osdisk-snapshot"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account used for exporting and importing snapshots."
  default = "jenapila399"
}