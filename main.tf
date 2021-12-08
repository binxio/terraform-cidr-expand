locals {
  cidr_prefix        = split("/", var.cidr)[1]
  cidr_prefix_length = pow(2, 32 - local.cidr_prefix)
}

locals {
  cidr_ip_addresses = [for n in range(local.cidr_prefix_length) : cidrhost(var.cidr, n)]
}