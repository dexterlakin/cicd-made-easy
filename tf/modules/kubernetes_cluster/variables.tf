variable "name" {
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "default_node_pool" {
  description = "(Required) A default_node_pool block"
  type = object({
    name                = string
    vm_size             = string
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    os_disk_size_gb     = number
    type                = string
  })
}

variable "dns_prefix" {
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "service_principal" {
  description = "(Required) A service_principal block"
  type        = map(string)
  default = {
    client_id     = "" # (Required) The Client ID for the Service Principal.
    client_secret = "" # (Required) The Client Secret for the Service Principal.
  }
}

variable "addon_profile" {
  description = "(Optional) A addon_profile block"
  default = {
    kube_dashboard = {
      enabled = false
    }
  }
}

variable "api_server_authorized_ip_ranges" {
  description = "(Optional) The IP ranges to whitelist for incoming traffic to the masters."
  type        = list(string)
  default     = []
}

variable "enable_pod_security_policy" {
  description = "(Optional) Whether Pod Security Policies are enabled. Note that this also requires role based access control to be enabled."
  type        = bool
  default     = false
}

variable "identity" {
  description = "A identity block. Changing this forces a new resource to be created."
  type        = map(string)
  default = {
    type = "SystemAssigned"
  }
}

variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = "1.17.3"
}

variable "public_ssh_key" {
  description = "(Optional) A public_ssh_key"
  type        = string
  default     = ""
}

variable "network_profile" {
  description = "(Optional) A network profile block"
  type        = map(string)
  default = {
    network_plugin = "kubenet"
  }
}

variable "tags" {
  default     = {}
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "role_based_access_control" {
  description = "A role_based_access_control block"
  type        = map(bool)
  default = {
    enabled = true # Changing this forces a new resource to be created.
  }
}
