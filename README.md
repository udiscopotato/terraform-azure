To manage an already existing resource Azure using terraform state management, you need to import the exsisting azure resource first.
To import a resource details in terraform run:
    ``` terraform import [options] ADDRESS-ID ```
for example, suppose in your main.tf you described a resource like this:
    ```
        resource "azurerm_resource_group" "main" {
            name     = "demoResourceGroup"
            location =  "eastus"
        }
    ```
then the import command will be
    ``` terraform import azurerm_resource_group.main /subscriptions/subsc-id/resourceGroups/demoResourceGroup ```