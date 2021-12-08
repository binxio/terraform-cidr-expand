module "example_ip_rules_expand" {
  source = "../../modules/azure-storage-account-ip-rules-expand"
  # source = "git::https:/github.com/binxio/terraform-cidr-expand/modules/azure-storage-account-ip-rules-expand.git?ref=1.0.0"

  address_prefixes = ["1.1.1.0/29", "2.2.2.0/30", "3.3.3.0/31", "4.4.4.0/32"]
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "West Europe"
  name                     = "iprulesexample"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  network_rules {
    default_action = "Deny"
    ip_rules       = module.example_ip_rules_expand.ip_rules
  }
}