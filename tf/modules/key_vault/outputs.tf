output "id" {
  value       = azurerm_key_vault.vault.id
  description = "The ID of the Key Vault"
}

output "name" {
  value       = azurerm_key_vault.vault.name
  description = "The name of the Key Vault"
}

output "uri" {
  value       = azurerm_key_vault.vault.vault_uri
  description = "The URI of the Key Vault"
}

output "secrets" {
  value       = { for k, v in azurerm_key_vault_secret.secrets : v.name => v.id }
  description = "A mapping of secret names and URIs."
}

output "references" {
  value = {
    for k, v in azurerm_key_vault_secret.secrets :
    v.name => format("@Microsoft.KeyVault(SecretUri=%s)", v.id)
  }
  description = "A mapping of Key Vault references for App Service and Azure Functions."
}