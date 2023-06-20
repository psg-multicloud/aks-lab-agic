# Criar grupo de segurança Azure para aks

resource "azurerm_network_security_group" "nsg_aks" {
  name                = var.name_nsg_aks
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lab.name
}
# Criar grupo de segurança Azure para appgw

resource "azurerm_network_security_group" "nsg_appgw" {
  name                = var.name_nsg_appgw
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lab.name
}

# Criar regras de segurança dentro do grupo de segurança Azure para o aks

resource "azurerm_network_security_rule" "regras_entrada_basicas_aks" {
  for_each                    = var.regras_entrada_basicas_aks
  resource_group_name         = azurerm_resource_group.rg_lab.name
  name                        = "porta_entrada_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  protocol                    = "Tcp"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg_aks.name
}

# Criar regras de segurança dentro do grupo de segurança Azure para o appgw

resource "azurerm_network_security_rule" "regras_entrada_basicas_appgw" {
  for_each                    = var.regras_entrada_basicas_appgw
  resource_group_name         = azurerm_resource_group.rg_lab.name
  name                        = "porta_entrada_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  protocol                    = "Tcp"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg_appgw.name
}

# Associar o grupo de segurança a subnet do aks.

resource "azurerm_subnet_network_security_group_association" "nsga_aks" {
  subnet_id                 = azurerm_subnet.subnet_aks.id
  network_security_group_id = azurerm_network_security_group.nsg_aks.id
}

# Associar o grupo de segurança a subnet do appgw.

resource "azurerm_subnet_network_security_group_association" "nsga_appgw" {
  subnet_id                 = azurerm_subnet.subnet_appgw.id
  network_security_group_id = azurerm_network_security_group.nsg_appgw.id
}