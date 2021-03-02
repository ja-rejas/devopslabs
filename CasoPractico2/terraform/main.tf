# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs
# definimos el provider de modo que en este punto se indica que vamos a ir contra azure
terraform {
 required_providers {
  azure = {
   source = "hashicorp/azurerm"
   #source = "terraform-providers/azurerm"
   version = "=2.46.1"
  }
 }
}

# Una vez creado el Service Principal se deberían rellenar los siguientes datos para autenticar
# en el provider. Por seguridad y por buenas prácticas, esta sección se documenta en un fichero credentials.tf
#que no está disponible para los demás usuarios (no se subirá al repositorio)
#provider "azurerm" {
# features {}
# subscription_id = ""
# client_id	 = ""
# client_secret	 = ""
# tenant_id	 = ""
#}

# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs/resources/resource_group
# En el resource group indicaremos la localización de las máquinas de definiremos
resource "azurerm_resource_group" "rg" {
 name	= "kubernetes_rg"
 location = var.location
 
 tags = {
  environment = "CP2"
 }
}

#Storage account: Se utilizará para almacenar la información relativa de las máquinas
# https://registry.terraform.io/providers/hasicorp/azurerm/latest/docs/resources/storage_aacount

resource "azurerm_storage_account" "JARG_stAccount" {
	name			= "staccountcp2jarg"
	resource_group_name	= azurerm_resource_group.rg.name
	location		= azurerm_resource_group.rg.location
	account_tier		= "Standard"
	account_replication_type= "LRS"

	tags = {
	 environment = "CP2"
 	}
}

