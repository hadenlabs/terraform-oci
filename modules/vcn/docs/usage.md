# How to use this Module

## Basic Example

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = "ocid1.compartment.oc1..example"
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "production-vcn"
  dns_label      = "prodvcn"
  module_enabled = true
}
```

## Example with Multiple CIDR Blocks

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = "ocid1.compartment.oc1..example"
  cidr_blocks    = ["10.0.0.0/16", "192.168.0.0/24"]
  display_name   = "multi-cidr-vcn"
  dns_label      = "multicidr"
  is_ipv6enabled = false
  module_enabled = true
}
```

## Example with Tags

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = "ocid1.compartment.oc1..example"
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "tagged-vcn"

  freeform_tags = {
    environment = "production"
    project     = "ecommerce"
    managed-by  = "terraform"
  }

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "terraform"
    "Oracle-Tags.CreatedOn" = "2024-01-01"
  }

  module_enabled = true
}
```

## Example with IPv6 Enabled

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = "ocid1.compartment.oc1..example"
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "ipv6-vcn"
  dns_label      = "ipv6vcn"
  is_ipv6enabled = true
  module_enabled = true
}
```

## Example with Dynamic module_enabled

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = "ocid1.compartment.oc1..example"
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "conditional-vcn"
  module_enabled = var.create_vcn
}

variable "create_vcn" {
  description = "Whether to create the VCN"
  type        = bool
  default     = true
}
```

## Using VCN Output in Other Modules

```hcl
module "vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/vcn?ref=0.0.0"

  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "main-vcn"
  module_enabled = true
}

module "subnet" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/subnet?ref=0.0.0"

  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.0.1.0/24"
  display_name   = "public-subnet"
  module_enabled = module.vcn.module_enabled
}
```

## Important Notes

1. **CIDR Blocks**: Must be non-overlapping and valid RFC 1918 addresses or public ranges
2. **DNS Label**: Must be unique within the region and follow DNS naming conventions
3. **Regional Resource**: VCNs are regional, not tied to specific Availability Domains
4. **Hierarchy**: VCN → Subnet → Instance (resources must be created in this order)
5. **Network Components**: VCN works with:
   - Internet Gateway (for public internet access)
   - NAT Gateway (for private instances to access internet)
   - Dynamic Routing Gateway (for on-premises connectivity)
   - Service Gateway (for OCI services access)

```

### 2.12 docs/contributing.md
```
