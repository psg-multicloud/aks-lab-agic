# Criar AKS

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name_aks
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lab.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name           = var.nodepool_01
    node_count     = 1
    vnet_subnet_id = azurerm_subnet.subnet_aks.id
    vm_size        = var.size_vm
  }

  identity {
    type = "SystemAssigned"
  }
  depends_on = [azurerm_resource_group.rg_lab, azurerm_virtual_network.vnet_lab, azurerm_subnet.subnet_aks, azurerm_network_security_group.nsg_aks]
}
