resource "azurerm_public_ip" "public-ip" {
  name                = "${var.name}-public-ip"
  location              = var.location
  resource_group_name   = var.resource_group_name
  allocation_method     = "Static"
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

resource "azurerm_linux_virtual_machine" "spot_vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  size                = "Standard_D2s_v3"
  admin_username      = "azuser"
  admin_password      = "DevOps@123"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Compute/images/devops-practice-image"

  # Spot VM specific configurations
  priority        = "Spot"
  eviction_policy = "Deallocate"
  max_bid_price   = -1 # Optional: Set your maximum bid price in USD
}

resource "azurerm_dns_a_record" "public" {
  name                = var.name
  zone_name           = "azdevopsb1.online"
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_public_ip.public-ip.ip_address]
}

resource "azurerm_dns_a_record" "private" {
  name                = "${var.name}-int"
  zone_name           = "azdevopsb1.online"
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_network_interface.privateip.private_ip_address]
}

resource "azurerm_network_interface_security_group_association" "example_nsg_association" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id="/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/project-allow-all-ports"
}