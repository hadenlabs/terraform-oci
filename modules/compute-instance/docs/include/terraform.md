<!-- markdown-link-check-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| cloudflare | >=3.4.0 |
| null | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| cloudflare | >=3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_email.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/email) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is true. | `bool` | `true` | no |
| name | The name of the email | `string` | n/a | yes |
| proxied | (Optional) Implement proxied for email. Default is false | `bool` | `false` | no |
| ttl | The TTL of the email (automatic: '1') | `number` | `3600` | no |
| type | The type of the email | `string` | `"A"` | no |
| value | The (string) value of the email. Either this or data must be specified | `string` | n/a | yes |
| zone | name of zone e.g. 'domain.dev' or 'domain.com' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| created\_on | The RFC3339 timestamp of when the email was created. |
| hostname | The FQDN of the email. |
| id | id of email. |
| metadata | A key-value map of string metadata Cloudflare associates with the email. |
| modified\_on | The RFC3339 timestamp of when the email was last modified. |
| module\_enabled | Whether the module is enabled. |
| proxiable | Shows whether this email can be proxied, must be true if setting proxied=true. |
<!-- END_TF_DOCS -->
<!-- markdown-link-check-enable -->