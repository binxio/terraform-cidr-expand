locals {
  cidr_prefix = split("/", var.cidr)[1]

  # NOTE: IPv6 uses 128 bits, where IPv4 uses 32 bits
  max_cidr_prefix = can(regex("[:]", var.cidr)) ? 128 : 32
}

locals {
  cidr_ip_addresses = [for n in range(pow(2, local.max_cidr_prefix - local.cidr_prefix)) : cidrhost(var.cidr, n)]
}