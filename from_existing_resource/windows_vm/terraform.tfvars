resource_group_name     = "demo-rg"
resource_group_location = "Central India"

virtual_network_name               = "subham-demo-vnet"
virtual_network_address_range      = ["10.0.0.0/16"]
virtual_network_location           = "Central India"
virtual_network_rg                 = "demo-rg"
virtual_subnet_name                = "default"
virtual_subnet_address_prefixes    = ["10.0.0.0/24"]
network_interface_name             = "subham-demo526"
virtual_network_interface_loctaion = "Central India"
virtual_network_interface_rg       = "demo-rg"
ip_configuration_name              = "ipconfig1"
private_ip_address_allocation      = "Dynamic"
public_ip_address_id               = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/demo-rg/providers/Microsoft.Network/publicIPAddresses/subham-demo-ip"
subnet_id                          = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/demo-rg/providers/Microsoft.Network/virtualNetworks/subham-demo-vnet/subnets/default"

os_disk_name                = "subham-demo_disk1_7157d78d478c47229b4c2ffefe6c65f2"
os_disk_resource_group_name = "DEMO-RG"
os_disk_location            = "Central India"
storage_account_type        = "Premium_LRS"
os_disk_create_option       = "FromImage"
os_disk_image_reference_id  = "/Subscriptions/e745208b-2246-4f79-b23a-2d28807e878a/Providers/Microsoft.Compute/Locations/CentralIndia/Publishers/microsoftwindowsserver/ArtifactTypes/VMImage/Offers/windowsserver/Skus/2019-datacenter-gensecond/Versions/17763.6054.240703"
hyper_v_generation          = "V2"
os_type                     = "Windows"
on_demand_bursting_enabled  = false
trusted_launch_enabled      = true

data_disk_name                 = "subham-demo_DataDisk_0"
data_disk_resource_group_name  = "demo-rg"
data_disk_location             = "Central India"
data_disk_storage_account_type = "Standard_LRS"
data_disk_create_option        = "Empty"

disk_name                 = "disk_2"
disk_resource_group_name  = "demo-rg"
disk_location             = "Central India"
disk_storage_account_type = "Standard_LRS"
disk_create_option        = "Empty"


vm_name                 = "subham-demo"
vm_location             = "Central India"
vm_resource_group_name  = "demo-rg"
vm_size                 = "Standard_B2s"
vm_network_interface_id = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/demo-rg/providers/Microsoft.Network/networkInterfaces/subham-demo526"

os_disk_managed_disk_id   = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/DEMO-RG/providers/Microsoft.Compute/disks/subham-demo_disk1_7157d78d478c47229b4c2ffefe6c65f2"
os_disk_type              = "Premium_LRS"
data_disk_managed_disk_id = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/demo-rg/providers/Microsoft.Compute/disks/subham-demo_DataDisk_0"
data_disk_type            = "Standard_LRS"
disk_managed_disk_id      = "/subscriptions/79f73bcd-8c64-46f9-9835-b90da392d15b/resourceGroups/demo-rg/providers/Microsoft.Compute/disks/disk_2"
admin_username            = ""
admin_password            = ""
os_profile_computer_name  = "subham-demo"
