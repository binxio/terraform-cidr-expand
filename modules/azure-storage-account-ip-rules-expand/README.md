# Module: Azure Storage Account IP Rules Expand

This Terraform module takes a list of IP addresses in CIDR notation and returns the IP rules in CIDR format suitable for Azure Storage Accounts. The module ensures that `/31`- and `/32`-prefixes are mapped to regular IP addresses, while keeping the original CIDR-block for other addresses.

