# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs

terraform {
 required_providers {
  azurerm = {
   source = "hashicorp/azurerm"
   #source = "terraform-providers/azurerm"
   version = "=2.46.1"
  }
 }
}

# Crea un service principal y rellena los siguientes datos para autenticar
#provider "azurerm" {
# features {}
# subscription_id = ""
# client_id	 = ""
# client_secret	 = ""
# tenant_id	 = ""
#}

# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
 name	= "kubernetes_rg"
 location = var.location
 
 tags = {
  environment = "CP2"
 }
}

#Storage account
# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs/resources/storage_aacount

resource "azure_storage_account" "JARG_stAccount" {
	name			= "JARG_staccountcp2"
	resource_group_name	= azurerm_resource_group.rg.name
	location		= azurerm_resource_group.rg.location
	account_tier		= "Standard"
	account_replication_type= "LRS"

	tags = {
	 environment = "CP2"
 	}
}

