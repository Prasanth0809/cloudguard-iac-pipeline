resource "azurerm_network_security_group" "cloudguard_nsg" {
  name                = "cloudguard-nsg"
  location            = azurerm_resource_group.cloudguard_rg.location
  resource_group_name = azurerm_resource_group.cloudguard_rg.name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.1/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "private_nsg" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.cloudguard_nsg.id
}