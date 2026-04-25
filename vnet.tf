resource "azurerm_virtual_network" "cloudguard_vnet" {
  name                = "cloudguard-vnet"
  location            = azurerm_resource_group.cloudguard_rg.location
  resource_group_name = azurerm_resource_group.cloudguard_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.cloudguard_rg.name
  virtual_network_name = azurerm_virtual_network.cloudguard_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.cloudguard_rg.name
  virtual_network_name = azurerm_virtual_network.cloudguard_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}