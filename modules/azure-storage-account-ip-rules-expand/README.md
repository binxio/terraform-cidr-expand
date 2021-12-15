# Module: Azure Storage Account IP Rules Expand

This Terraform module takes a list of IP addresses in CIDR notation and returns the IP rules in CIDR format suitable for Azure Storage Accounts. The module ensures that `/31`- and `/32`-prefixes are mapped to regular IP addresses, while keeping the original CIDR-block for other addresses.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes, in CIDR notation, to use in `ip_rules`. Required format: [ '0.0.0.0/0' ] | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_rules"></a> [ip\_rules](#output\_ip\_rules) | List of IP addresses in CIDR format. |
<!-- END_TF_DOCS -->
