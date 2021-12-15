locals {
  cidr_prefix = split("/", var.cidr)[1]
}

locals {
  cidr_ip_addresses = [for n in range(pow(2, 32 - local.cidr_prefix)) : cidrhost(var.cidr, n)]
}