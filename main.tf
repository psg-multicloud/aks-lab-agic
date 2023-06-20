terraform {
  backend "azurerm" {
    storage_account_name = "azuterraformstate"
    container_name       = "azutfstate"
    resource_group_name  = "AZU-TERRAFORM-STATE"
    key                  = "lab.appgw.terraform.tfstate"
    subscription_id      = "ade4fb6f-4bb2-4132-9e30-e9e41d5ccaf8"
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {
  }
}