terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true  // It tells the Terraform Azure provider to use the federated token that the azure/login@v2 step injects automatically.
  #   subscription_id = "enter-your-subscription-id-here"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "ritkargs"
    storage_account_name = "ritkasas"
    container_name       = "ritkascs"
    key                  = "first.tfstate"
  }
}