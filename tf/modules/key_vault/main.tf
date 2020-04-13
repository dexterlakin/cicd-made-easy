data "azurerm_client_config" "this" {}

resource "azurerm_key_vault" "vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.this.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  sku_name = var.sku
  tags     = var.tags
}

resource "azurerm_key_vault_access_policy" "access_policies" {
  # note: should always include self permissions
  count = length(var.access_policies)

  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.this.tenant_id
  object_id    = var.access_policies[count.index].object_id

  key_permissions         = var.access_policies[count.index].key_permissions
  secret_permissions      = var.access_policies[count.index].secret_permissions
  certificate_permissions = var.access_policies[count.index].certificate_permissions
  storage_permissions     = var.access_policies[count.index].storage_permissions
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.secrets
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.vault.id

  # Terraform needs to have access before we can create secrets
  depends_on = [
    azurerm_key_vault_access_policy.access_policies
  ]
}