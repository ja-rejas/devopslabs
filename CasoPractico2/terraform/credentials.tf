# Crea un service principal y rellena los siguientes datos para autenticar
provider "azurerm" {
 features {}
 subscription_id = "63d8cdc3-9f78-4424-983d-8547a6c03b5b"
 client_id       = "http://JARG_SP"
 client_secret   = "f.XQlJFFxGN4m-1hRVIqSvRkGh1DBwb4GP"
 tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

