variable "business_unit" {}
variable "location" {}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}