resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location

  tags = var.tags
}

resource "azurerm_management_lock" "rg-lock" {
  name       = "${var.name}-lock"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Locked with '${var.lock_level}' lock"

  #If lock_level is empty, don't create this resource
  count = var.lock_level != "" ? 1 : 0
}
