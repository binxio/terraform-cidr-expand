terraform {
  required_version = ">= 0.13.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.88"
    }
  }
}

provider "azurerm" {
  features {}
}