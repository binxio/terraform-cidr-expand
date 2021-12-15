# CIDR Expand

This Terraform module takes a CIDR-block and returns all IP addresses in the CIDR-block as a list. This allows you to use CIDR notation for IP addresses everywhere and simplify your Terraform interface.

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
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The IP address range in CIDR notation. Required format: '0.0.0.0/0' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_addresses"></a> [ip\_addresses](#output\_ip\_addresses) | List of IP addresses in provided CIDR. |
<!-- END_TF_DOCS -->
