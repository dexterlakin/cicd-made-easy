output "foo" {
    value = data.azurerm_client_config.this.subscription_id
}