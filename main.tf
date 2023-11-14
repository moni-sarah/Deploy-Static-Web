

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
   
}


# Create Resource Group
resource "azurerm_resource_group" "rg_indexweb" {
    name = var.rg_name
    location = var.rg_location
  
}

# Create Storage Account
resource "azurerm_storage_account" "static_storage" {
  name                     = "${var.sa_webindex_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_indexweb.name
  location                 = azurerm_resource_group.rg_indexweb.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = true

  static_website {
    index_document = var.index_document
  }
  }


# Add a index.html file to the storage account
resource "azurem_storage_blob" "index-html" {
    name = var.index_document
    storage_account_name = azurerm_storage_account.sa_webindex_name
    storage_container_name = "$web"
    type = "Block"
    content_type = "text/html"
    source_content = var.source_content

  
}



output "primary_web_endpoint" {
  value = azurerm_storage_account.static_storage.primary_web_endpoint 
  
}

