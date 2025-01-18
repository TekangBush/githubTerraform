terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Github_rg"
      storage_account_name = "bushstorageterraform"
      container_name       = "madicotekangtf"
      key                  = "devtf"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}



module "app_service" {
source = "../modules/Webapp"
app_plan_name = "githubapp"
app_service_name = "githubapp"
rg_location = "West Europe"
rg_name = "RG_GITHUB"

}