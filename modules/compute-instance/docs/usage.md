# How to use this Module

```hcl
module "main" {
  source = "git::https://github.com/hadenlabs/terraform-cloudflare.git//modules/email?ref=0.0.0"
  module_enabled         = var.module_enabled
  name                   = var.name
}
```
