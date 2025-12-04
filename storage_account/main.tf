# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "8378289b-756a-4d87-88be-37638bd44229"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "rdevopsb84tfstatechandra"
  resource_group_name      = "rg1"
  location                 = "Uk West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}


resource "azurerm_storage_container" "example" {
  name                  = "roboshop-state-files"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}