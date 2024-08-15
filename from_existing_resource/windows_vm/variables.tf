
# Resources Group
variable "resource_group_name" {
  description = "Enter the resource group name of the VM"
  type        = string
}

variable "resource_group_location" {
  description = "Enter the resource group location of the VM"
  type        = string
}

# Virtual Network
variable "virtual_network_name" {
  description = "Enter the Virtual Network of the VM"
  type        = string
}

variable "virtual_network_location" {
  description = "Enter the Virtual Network Location of the VM"
  type        = string
}

variable "virtual_network_rg" {
  description = "Enter the Virtual Network Resource Group Name"
  type        = string
}

variable "virtual_network_address_range" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "virtual_subnet_name" {
  description = "Enter the Virtual Subenet of the VM"
  type        = string
}

variable "virtual_subnet_address_prefixes" {
  description = "The address space that is used by the virtual subnet"
  type        = list(string)
}

variable "network_interface_name" {
  description = "Enter the Virtual Subenet of the VM"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "virtual_network_interface_rg" {
  description = "Enter the Virtual Network interface Resource Group Name"
  type        = string
}

variable "virtual_network_interface_loctaion" {
  description = "Enter the Virtual Network interface Loctaion Name"
  type        = string
}

# OS DISK 
variable "os_disk_name" {
  description = "The name of the managed disk"
  type        = string
}

variable "os_disk_resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "os_disk_location" {
  description = "The location of the resource group"
  type        = string
}

variable "storage_account_type" {
  description = "The storage account type"
  type        = string
}

variable "os_disk_create_option" {
  description = "The create option for the managed disk"
  type        = string
}

variable "os_disk_image_reference_id" {
  description = "The image reference ID"
  type        = string
}

variable "hyper_v_generation" {
  description = "The Hyper-V generation"
  type        = string
}

variable "os_type" {
  description = "The OS type"
  type        = string
}

variable "on_demand_bursting_enabled" {
  description = "Whether on-demand bursting is enabled"
  type        = bool
}

variable "trusted_launch_enabled" {
  description = "Whether trusted launch is enabled"
  type        = bool
}

# variable "tags" {
#   description = "Tags for the managed os disk"
#   type        = map(string)
# }

# DATA DISK 
variable "data_disk_name" {
  description = "The name of the managed data disk"
  type        = string
}

variable "data_disk_resource_group_name" {
  description = "The resource group name for the data disk"
  type        = string
}

variable "data_disk_location" {
  description = "The location for the data disk"
  type        = string
}

variable "data_disk_storage_account_type" {
  description = "The storage account type for the data disk"
  type        = string
}

variable "data_disk_create_option" {
  description = "The create option for the data disk"
  type        = string
}

# Virtual Machine
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_location" {
  description = "The location of the virtual machine"
  type        = string
}

variable "vm_resource_group_name" {
  description = "The resource group name for the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "vm_network_interface_id" {
  description = "The ID of the network interface for the virtual machine"
  type        = string
}

# variable "vm_tags" {
#   description = "Tags for the virtual machine"
#   type        = map(string)
# }

variable "os_disk_managed_disk_id" {
  description = "The managed disk ID of the OS disk"
  type        = string
}

variable "os_disk_type" {
  description = "The storage account type of the OS disk"
  type        = string
}

variable "data_disk_managed_disk_id" {
  description = "The managed disk ID of the data disk"
  type        = string
}

variable "data_disk_type" {
  description = "The storage account type of the data disk"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
}

variable "os_profile_computer_name" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_name" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_resource_group_name" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_location" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_storage_account_type" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_create_option" {
  description = "The computer name for the OS profile"
  type        = string
}

variable "disk_managed_disk_id" {
  description = "The computer name for the OS profile"
  type        = string
}
