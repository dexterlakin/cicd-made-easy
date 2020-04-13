output "id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.main.id
}

output "fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.main.fqdn
}

output "kube_config" {
  value = {
    client_key         = azurerm_kubernetes_cluster.main.kube_config[0].client_key
    client_certificate = azurerm_kubernetes_cluster.main.kube_config[0].client_certificate
    ca_certificate     = azurerm_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate
    host               = azurerm_kubernetes_cluster.main.kube_config[0].host
    username           = azurerm_kubernetes_cluster.main.kube_config[0].username
    password           = azurerm_kubernetes_cluster.main.kube_config[0].password
  }
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.main.node_resource_group
}
