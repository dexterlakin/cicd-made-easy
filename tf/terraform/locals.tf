locals {
  key_vault_name       = "kv-${var.business_unit}-${var.location}-tf"
  resource_group_name  = "rg_${var.business_unit}_${var.location}_tf"
  storage_account_name = "${lower("sa")}${lower(var.business_unit)}${lower(var.location)}tf"
}