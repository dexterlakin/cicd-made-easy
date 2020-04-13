variable "name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}

variable "lock_level" {
  description = "Possible values are null, CanNotDelete or ReadOnly."
  type        = string
  default     = ""
}
