resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_app_service_plan" "appplan1" {
  name                = var.app_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.appplan1.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

