locals {
  cidr_prefixes = [
    for address_prefix in var.address_prefixes : {
      cidr   = address_prefix
      prefix = split("/", address_prefix)[1]
    }
  ]
}

locals {
  # NOTE: "Small address ranges using "/31" or "/32" prefix sizes are not supported.
  #        These ranges should be configured using individual IP address rules."
  #       Source: https://docs.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range
  cidr_ip_rules = flatten([
    for cp in local.cidr_prefixes : cp.prefix <= 30
    ? [cp.cidr]
    : [for n in range(pow(2, 32 - cp.prefix)) : cidrhost(cp.cidr, n)]
  ])
}