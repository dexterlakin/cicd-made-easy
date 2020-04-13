variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
  type        = string
}

variable "account_encryption_source" {
  description = "The Encryption Source for this Storage Account."
  default     = "Microsoft.Storage"
  type        = string
}

variable "account_tier" {
  description = "The Tier of this storage account"
  default     = "Standard"
  type        = string
}

variable "account_kind" {
  description = "The Kind of account"
  default     = "StorageV2"
  type        = string
}

variable "account_replication_type" {
  description = "The type of replication used for this storage account."
  default     = "LRS"
  type        = string
}

variable "containers" {
  description = "List of containers to create and their access levels."
  type = list(object({
    name        = string,
    access_type = string
  }))
  default = []
}

variable "enable_blob_encryption" {
  description = "Are Encryption Services are enabled for Blob storage?"
  default     = true
  type        = bool
}

variable "enable_file_encryption" {
  description = "Are Encryption Services are enabled for File storage?"
  default     = true
  type        = bool
}

variable "enable_https_traffic_only" {
  description = "Is traffic only allowed via HTTPS?"
  default     = true
  type        = bool
}

variable "location" {
  description = "The Azure location where the Storage Account exists"
  type        = string
}

variable "name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = object({ ip_rules = list(string), subnet_ids = list(string), bypass = list(string) })
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group the Storage Account is located in"
  type        = string
}

variable "soft_delete_retention" {
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  type        = number
  default     = 31
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
