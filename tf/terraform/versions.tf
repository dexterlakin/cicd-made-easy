# Pinning to the specific version of the Azure Provider you're using is recommended
# Because new versions are released frequently
# Using the latest providers as of 27/03/2020
provider "azurerm" {
  version         = "~> 2.0.0"
  features {}
}

provider "azuread" {
  version         = "~> 0.7.0"
}

provider "random" {
  version = "~> 2.2.1"
}
