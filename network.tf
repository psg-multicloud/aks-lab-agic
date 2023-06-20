# # Criar Grupo de Recurso que armazenará os recursos Azure

resource "azurerm_resource_group" "rg_lab" {
  name     = var.name_rg
  location = var.location
  tags     = var.tags
}

# Criar Virtual Network Azure

resource "azurerm_virtual_network" "vnet_lab" {
  name                = var.name_vnet
  resource_group_name = azurerm_resource_group.rg_lab.name
  location            = var.location
  address_space       = var.vnet_address_space
  depends_on          = [azurerm_resource_group.rg_lab]
}

# Criar Subnet dentro da Vnet Azure para o AKS

resource "azurerm_subnet" "subnet_aks" {
  name                 = var.name_subnet_aks
  resource_group_name  = azurerm_resource_group.rg_lab.name
  virtual_network_name = azurerm_virtual_network.vnet_lab.name
  address_prefixes     = var.subnet_address_aks
}

# Criar Subnet dentro da Vnet Azure para o appgw

resource "azurerm_subnet" "subnet_appgw" {
  name                 = var.name_subnet_appgw
  resource_group_name  = azurerm_resource_group.rg_lab.name
  virtual_network_name = azurerm_virtual_network.vnet_lab.name
  address_prefixes     = var.subnet_address_appgw
}