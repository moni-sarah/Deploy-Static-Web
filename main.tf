terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.80.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  
}



resource "azurerm_resource_group" "demo-rg" {
  name     = var.demo-rg
  location = var.demo-rg-location
}

# Create Storage Account
resource "azurerm_storage_account" "static-web-storage-account" {
  name                     = var.myprojectstorage00231
  resource_group_name      = azurerm_resource_group.demo-rg.name
  location                 = azurerm_resource_group.demo-rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = true

  static_website {
    index_document = var.index_document
  }
  }


resource "azurerm_storage_container" "az_sc_backend" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.static-web-storage-account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "web_content" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.static-web-storage-account.name
  storage_container_name = azurerm_storage_container.az_sc_backend.name
  type                   = "Block"
  }

  output "primary_web_endpoint" {
  description = "The primary web endpoint for the static website of the storage account"
  value       = azurerm_storage_account.static-web-storage-account.name
}