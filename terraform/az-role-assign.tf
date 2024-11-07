terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}
resource "azurerm_role_assignment" "example" {
  scope                = "/subscriptions/YOUR_SUBSCRIPTION_ID"
  role_definition_name = "Owner"
  principal_id         = "AZURE_AD_USER_OBJECT_ID"
}
