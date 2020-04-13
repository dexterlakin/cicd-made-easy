output "storage_account_name" {
  value = module.storage_account.name
}

output "storage_account_access_key" {
  value = module.storage_account.primary_access_key
  sensitive   = true
}

output "storage_account_resource_group_name" {
  value = module.resource_group.name
}