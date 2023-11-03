terraform {
  required_version = ">1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}

terraform {
  cloud {
    organization = "dh-az-terraform"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "811-50774838-provide-continuous-delivery-with-gith"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "dhstorage231101"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
