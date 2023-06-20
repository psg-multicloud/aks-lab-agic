##################
# USO GERAL       #
##################

#String

variable "location" {
  type        = string
  description = "Localizacao dos recursos da Azure"
  default     = "eastus"
}

##################
# GRUPO DE RECURSOS #
##################

#String
variable "name_rg" {
  type        = string
  description = "nome do resource group"
  default     = "RG-LAB-AGIC"
}

#Map
variable "tags" {
  type        = map(any)
  description = "tags nos recursos e servicos do azure"
  default = {
    ambiente        = "lab"
    responsavel     = "patricia"
    centro-de-custo = "contapessoal"
    provisioner     = "terraform"
  }
}

##################
# REDE VIRTUAL     #
##################


#string

variable "name_subnet_aks" {
  type    = string
  default = "subnet_aks"
}

#string

variable "name_subnet_appgw" {
  type    = string
  default = "subnet_appgw"
}
#String

variable "name_vnet" {
  type        = string
  description = "nome da vnet azure"
  default     = "vnet-lab"
}

#List

variable "vnet_address_space" {
  type        = list(any)
  description = "address space vnet Azure"
  default     = ["192.168.0.0/16"]
}

#List

variable "subnet_address_aks" {
  type        = list(any)
  description = "address subnet aks Azure"
  default     = ["192.168.3.0/24"]
}

#List

variable "subnet_address_appgw" {
  type        = list(any)
  description = "address subnet aks Azure"
  default     = ["192.168.2.0/24"]
}


########
# APPGW #
########

#String
variable "pip_appgw" {
  type        = string
  description = "nome do ip publico para o appgw"
  default     = "pip-appgw"
}

#String
variable "name_config_pip" {
  type        = string
  description = "nome da config ip"
  default     = "ipexterno-config-appgw"
}

#String

variable "backend_address_pool_name" {
  type    = string
  default = "subnet_appgw_bapn_01"
}

#String
variable "frontend_port_name" {
  type    = string
  default = "subnet_appgw_fpn_01"
}

#String
variable "frontend_ip_configuration_name" {
  type    = string
  default = "subnet_appgw_ficn_01"
}

#String
variable "http_setting_name" {
  type    = string
  default = "subnet_appgw_hsn_01"
}

#String
variable "listener_name" {
  type    = string
  default = "subnet_appgw_ln_01"
}

#String
variable "request_routing_rule_name" {
  type    = string
  default = "subnet_appgw_rrrn_01"
}

#String
variable "redirect_configuration_name" {
  type    = string
  default = "subnet_appgw_rcn_01"
}

#String

variable "appgw_name" {
  type    = string
  default = "appgw_agic_01"

}

variable "gip_name" {
  type    = string
  default = "gip_conf"
}

########
# AKS   #
########

#String
variable "size_vm" {
  type        = string
  description = "size vm"
  default     = "Standard_B2s"
}

#String

variable "name_aks" {
  type    = string
  default = "aks_01"

}

#String
variable "dns_prefix" {
  type    = string
  default = "aks"

}

variable "nodepool_01" {
  type    = string
  default = "nodepool01"
}

#####################
# GRUPO DE SEGURANÇA  #
######################

#String

variable "name_nsg_aks" {
  type        = string
  description = "nome do grupo de segurança Azure para o AKS"
  default     = "nsg-aks"
}

#String

variable "name_nsg_appgw" {
  type        = string
  description = "nome do grupo de segurança Azure para o application gateway"
  default     = "nsg-appgw"
}


#String

variable "regras_entrada_basicas_aks" {
  type = map(any)
  default = {
    "110" = "1-65535"
  }
}

#String

variable "regras_entrada_basicas_appgw" {
  type = map(any)
  default = {
    "110" = "1-65535"
  }
}