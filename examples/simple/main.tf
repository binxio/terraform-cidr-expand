module "cidr_expand" {
  source = "../../"
  # source = "git::https:/github.com/binxio/terraform-cidr-expand.git?ref=1.0.0"

  cidr = "192.168.0.0/28"
}

output "cidr_expand_ip_addresses" {
  description = "IP addresses in CIDR-block."
  value       = module.cidr_expand.ip_addresses
}