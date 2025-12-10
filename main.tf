# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  backend "azurerm" {
    # Backend configuration is provided via init command or backend config file
  }
}

provider "azurerm" {
  features {}
  
  # Authentication is handled via environment variables:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID
}

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "rg-mycloud-dev"
  location = "westeurope"

  tags = {
    environment = "development"
    managed_by  = "terraform"
  }
}
