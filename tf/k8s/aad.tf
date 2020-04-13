resource "random_id" "aks" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.k8s.name
  }
  byte_length = 2
}

resource "azuread_application" "aks" {
  name = "aks${random_id.aks.dec}"
}

resource "azuread_service_principal" "aks" {
  application_id = azuread_application.aks.application_id
}

# Generate a password for our service principal
resource "random_string" "aks" {
  length  = "32"
  special = true
}

# Set the password of the service principal
resource "azuread_service_principal_password" "aks" {
  service_principal_id = azuread_service_principal.aks.id
  value                = random_string.aks.result
  end_date             = "2021-01-01T01:02:03Z"
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azuread_service_principal.aks.id
  skip_service_principal_aad_check = true
}
