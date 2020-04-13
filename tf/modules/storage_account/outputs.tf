output "id" {
  description = "Id of the storage account created"
  value       = azurerm_storage_account.storage.id
}

output "name" {
  description = "Name of the storage account created"
  value       = azurerm_storage_account.storage.name
}

output "containers" {
  value       = azurerm_storage_container.container
  description = "test"
}

output "primary_access_key" {
  description = "The primary access key for the Storage Account"
  value       = azurerm_storage_account.storage.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key for the Storage Account"
  value       = azurerm_storage_account.storage.secondary_access_key
}