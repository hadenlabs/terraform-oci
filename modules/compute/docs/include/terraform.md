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
| oci | >= 4.67.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_identity_availability_domains.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_domain | The availability domain for the instance | `string` | n/a | yes |
| boot\_volume\_size\_in\_gbs | The size of the boot volume in GBs | `number` | `null` | no |
| compartment\_id | The OCID of the compartment | `string` | n/a | yes |
| defined\_tags | Defined tags for the instance | `map(string)` | `{}` | no |
| display\_name | The display name of the instance | `string` | n/a | yes |
| freeform\_tags | Freeform tags for the instance | `map(string)` | `{}` | no |
| image\_id | The OCID of the image | `string` | n/a | yes |
| metadata | Metadata for the instance | `map(string)` | `{}` | no |
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is true. | `bool` | `true` | no |
| shape | The shape of the instance | `string` | `"VM.Standard.E4.Flex"` | no |
| source\_type | The source type for the instance | `string` | `"IMAGE"` | no |
| ssh\_public\_key | The SSH public key for the instance | `string` | n/a | yes |
| subnet\_id | The OCID of the subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| display\_name | The display name of the instance |
| instance\_id | The OCID of the instance |
| instance\_state | The state of the instance |
| module\_enabled | Whether the module is enabled |
| private\_ip | The private IP of the instance |
| public\_ip | The public IP of the instance |
| shape | The shape of the instance |
| time\_created | The time the instance was created |
<!-- END_TF_DOCS -->
<!-- markdown-link-check-enable -->