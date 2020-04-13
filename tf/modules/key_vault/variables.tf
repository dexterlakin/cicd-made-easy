variable "access_policies" {
  description = "List of access policies for the Key Vault."
  default     = []
  type = list(object({
    object_id               = string,
    key_permissions         = list(string),
    secret_permissions      = list(string),
    certificate_permissions = list(string),
    storage_permissions     = list(string),
  }))
}

variable "name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "location" {
  type        = string
  description = "The location of the Key Vault."
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group for the Key Vault."
}

variable "sku" {
  type        = string
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault."
  default     = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow Resource Manager to retrieve secrets from the key vault."
  default     = false
}


variable "secrets" {
  type        = map(string)
  description = "A map of secrets for the Key Vault."
  default     = {}
}

variable "tags" {
  type        = map
  description = "A mapping of tags to assign to the resources."
  default     = {}
}

variable "containers" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, access_type = string }))
  default     = []
}