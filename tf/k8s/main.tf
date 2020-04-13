resource "azurerm_resource_group" "k8s" {
  name     = local.resource_group_name
  location = var.location
  tags     = var.tags
}

module "aks" {
  source              = "../modules/kubernetes_cluster"
  name                = local.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name

  default_node_pool = {
    name                = "default"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
    os_disk_size_gb     = 30
    type                = "VirtualMachineScaleSets"
  }

  dns_prefix = replace(local.cluster_name, "_", "-")

  service_principal = {
    client_id     = azuread_application.aks.application_id
    client_secret = azuread_service_principal_password.aks.value
  }

  tags = var.tags
}

resource "azurerm_container_registry" "acr" {
  name                = local.registry_name
  resource_group_name = azurerm_resource_group.k8s.name
  location            = azurerm_resource_group.k8s.location
  admin_enabled       = true
  sku                 = "Basic"
}
