variable "address_prefixes" {
  description = "The address prefixes, in CIDR notation, to use in `ip_rules`. Required format: [ '0.0.0.0/0' ]"
  type        = list(string)

  validation {
    condition     = alltrue([for prefix in var.address_prefixes : try(cidrhost(prefix, 0), null) != null])
    error_message = "An address prefix is invalid. All address prefixes must be of format '0.0.0.0/0'."
  }

  validation {
    condition = !anytrue([for prefix in var.address_prefixes : can(regex("[:]", prefix))])
    error_message = "An address prefix is invalid. Only IPv4 addresses are supported by Azure storage account."
  }
}