# How to use this Module

```hcl
module "main" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compute?ref=0.0.0"
  module_enabled         = var.module_enabled
}
```
