# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "8378289b-756a-4d87-88be-37638bd44229"
}

terraform {
  backend "azurerm" {
  }
}


module "vault" {
  source = "./module/spot-vm"
  location = "UK West"
  name = "vault"
  resource_group_name = "rg1"
  size                = "Standard_D2s_v3"
}

module "runner" {
  source = "./module/spot-vm"
  location = "UK West"
  name = "runner"
  resource_group_name = "rg1"
  size                = "Standard_D2s_v3"
}

module "elk-stack" {
  source = "./module/spot-vm"
  location = "UK West"
  name = "elk-stack"
  resource_group_name = "rg1"
  size = "Standard_E2bds_v5"
}