locals {
  cluster_name        = "aks_${var.business_unit}_${var.location}_cicd"
  registry_name        = "acr${var.business_unit}${var.location}cicd"
  resource_group_name = "rg_${var.business_unit}_${var.location}_cicd"
}
