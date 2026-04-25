terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f4e75962-f752-467c-a9ae-417bcc9202f2"
}

resource "azurerm_resource_group" "cloudguard_rg" {
  name     = "cloudguard-rg"
  location = "East US"
}