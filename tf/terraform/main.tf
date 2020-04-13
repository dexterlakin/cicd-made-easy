module "resource_group" {
  source   = "../modules/resource_group"
  name     = local.resource_group_name
  location = var.location
}

module "storage_account" {
  source              = "../modules/storage_account"
  name                = local.storage_account_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
  containers = [
    {
      name        = "terraform"
      access_type = "private"
    },
    {
      name        = "k8s"
      access_type = "private"
    }
  ]
}
