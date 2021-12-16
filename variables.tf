variable "cidr" {
  description = "The IP address range in CIDR notation. Required format: '0.0.0.0/0' (IPv4) or '::/0' (IPv6)"
  type        = string

  validation {
    condition     = try(cidrhost(var.cidr, 0), null) != null
    error_message = "The IP address range is invalid. Must be of format '0.0.0.0/0' (IPv4) or '::/0' (IPv6)."
  }
}