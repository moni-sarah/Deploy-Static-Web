
variable "demo-rg" {
    type = string
    description = "Name of resource groupe"
}

variable "demo-rg-location" {
    type = string
    description = "Location of the resource group"
}
variable "myprojectstorage00231" {
    type = string
    description = "The name of storage account "
}
variable "az_sc_backend" {
  type = string
  description = "The name of container"
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type = string   
}
variable "index_document" {
  description = "static website index document"
  type = string   
}

variable "source_content" {
  description = "static website source folder"
  type = string  
}

variable "access-key-vault" {
  type = string
  description = "the name of key vault"
}

