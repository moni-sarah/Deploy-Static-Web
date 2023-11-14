variable "rg_name" {
    type = string
    description = "Name of resource groupe"
}

variable "rg_location" {
    type = string
    description = "Location of the resource group"
}
variable "sa_webindex_name" {
    type = string
    description = "The name of storage account "
}

variable "storage_account_kind" {
  description = "Storage Account Kind"
  type = string   
}
variable "index_document" {
  description = "static website index document"
  type = string   
}
variable "static_website_error_404_document" {
  description = "static website error 404 document"
  type = string   
}
variable "source_content" {
  description = "static website source folder"
  type = string  
}