terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}
resource "azurerm_public_ip" "public-ip" {
  name                = "${var.name}-public-ip"
  location              = var.location
  resource_group_name   = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                = "${var.name}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  ip_configuration {
    name                          = "${var.name}"
    subnet_id                     = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id                = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Compute/images/devops-practice-image""
  }
  storage_os_disk {
    name              = var.name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.name}-dev"
    admin_username = "azuser"
    admin_password = "Devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}

resource "azurerm_dns_a_record" "public" {
  name                = var.name
  zone_name           = "azdevopsb1.online"
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_network_interface.privateip.private_ip_address]
}

resource "azurerm_dns_a_record" "private" {
  name                = "${var.name}-int"
  zone_name           = "azdevopsb1.online"
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_public_ip.public-ip.ip_address]
}

resource "azurerm_network_interface_security_group_association" "example_nsg_association" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/project-allow-all-ports"
}