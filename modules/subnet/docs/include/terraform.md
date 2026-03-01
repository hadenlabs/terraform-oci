<!-- markdown-link-check-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| oci | >= 4.67.3 |

## Providers

| Name | Version |
|------|---------|
| oci | 8.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_subnet.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet) | resource |
| [oci_identity_availability_domains.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_domain | The availability domain for the subnet. If not specified, the subnet will be regional. | `string` | `null` | no |
| cidr\_block | The CIDR block for the subnet. Must be a valid CIDR within the VCN's CIDR range and not overlap with other subnets in the same VCN. | `string` | n/a | yes |
| compartment\_id | The OCID of the compartment | `string` | n/a | yes |
| defined\_tags | Defined tags for the subnet | `map(string)` | `{}` | no |
| display\_name | The display name of the subnet | `string` | n/a | yes |
| dns\_label | A DNS label for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label to form a fully qualified domain name (FQDN) for instances in this subnet | `string` | `null` | no |
| freeform\_tags | Freeform tags for the subnet | `map(string)` | `{}` | no |
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is true. | `bool` | `true` | no |
| prohibit\_public\_ip\_on\_vnic | Whether to prohibit public IP addresses on VNICs in this subnet. Set to true for private subnets, false for public subnets. | `bool` | `true` | no |
| route\_table\_id | The OCID of the route table to associate with the subnet | `string` | `null` | no |
| security\_list\_ids | List of security list OCIDs to associate with the subnet | `list(string)` | `[]` | no |
| vcn\_id | The OCID of the VCN | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| availability\_domain | The availability domain of the subnet |
| cidr\_block | The CIDR block of the subnet |
| compartment\_id | The OCID of the compartment containing the subnet |
| defined\_tags | The defined tags of the subnet |
| display\_name | The display name of the subnet |
| dns\_label | The DNS label of the subnet |
| freeform\_tags | The freeform tags of the subnet |
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is true. |
| prohibit\_public\_ip\_on\_vnic | Whether public IP addresses are prohibited on VNICs in this subnet |
| route\_table\_id | The OCID of the route table associated with the subnet |
| security\_list\_ids | List of security list OCIDs associated with the subnet |
| state | The current state of the subnet |
| subnet\_id | The OCID of the created subnet |
| time\_created | The date and time the subnet was created |
| vcn\_id | The OCID of the VCN containing the subnet |
| virtual\_router\_ip | The IP address of the virtual router for the subnet |
| virtual\_router\_mac | The MAC address of the virtual router for the subnet |
<!-- END_TF_DOCS -->
<!-- markdown-link-check-enable -->