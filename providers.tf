terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.79.0"
    }
  }
   backend "azurerm" {
    resource_group_name = "rg-backend-name"
    storage_account_name = "sabtf-01"
    container_name = "ct-state-01"
    key = "rg-key.terraform.tfstate"
     
   }

}


provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
  
}
