provider vault{
  address = "http://vault-int.azdevopsb1.online:8200"
  token   = var.token
}

terraform {
  backend "azurerm" {
  }
}