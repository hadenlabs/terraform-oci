# Usage

This document provides examples of how to use the subnet module.

## Example 1: Basic Subnet

```hcl
module "subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.1.0/24"
  display_name   = "my-subnet"

  module_enabled = true
}
```

## Example 2: Public Subnet

```hcl
module "public_subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id             = "ocid1.compartment.oc1..example"
  vcn_id                     = "ocid1.vcn.oc1..example"
  cidr_block                 = "10.0.2.0/24"
  display_name               = "public-subnet"
  prohibit_public_ip_on_vnic = false  # Allow public IPs

  module_enabled = true
}
```

## Example 3: Private Subnet

```hcl
module "private_subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id             = "ocid1.compartment.oc1..example"
  vcn_id                     = "ocid1.vcn.oc1..example"
  cidr_block                 = "10.0.3.0/24"
  display_name               = "private-subnet"
  prohibit_public_ip_on_vnic = true  # Prohibit public IPs (default)

  module_enabled = true
}
```

## Example 4: Subnet with Route Table

```hcl
module "subnet_with_route_table" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.4.0/24"
  display_name   = "subnet-with-route"
  route_table_id = "ocid1.routetable.oc1..example"

  module_enabled = true
}
```

## Example 5: Subnet with Security Lists

```hcl
module "subnet_with_security_lists" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id    = "ocid1.compartment.oc1..example"
  vcn_id            = "ocid1.vcn.oc1..example"
  cidr_block        = "10.0.5.0/24"
  display_name      = "subnet-with-security"
  security_list_ids = [
    "ocid1.securitylist.oc1..example1",
    "ocid1.securitylist.oc1..example2"
  ]

  module_enabled = true
}
```

## Example 6: Subnet with DNS Label

```hcl
module "subnet_with_dns" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.6.0/24"
  display_name   = "dns-subnet"
  dns_label      = "appsubnet"

  module_enabled = true
}
```

## Example 7: Using Subnet Output in Compute Module

```hcl
module "subnet_for_compute" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.7.0/24"
  display_name   = "compute-subnet"

  module_enabled = true
}

module "compute_instance" {
  source = "github.com/hadenlabs/terraform-oci//modules/compute"

  compartment_id      = "ocid1.compartment.oc1..example"
  availability_domain = "us-ashburn-1"
  shape               = "VM.Standard.E4.Flex"
  subnet_id           = module.subnet_for_compute.subnet_id  # Using subnet output
  display_name        = "my-instance"
  image_id            = "ocid1.image.oc1..example"
  ssh_public_key      = "ssh-rsa AAAAB3NzaC1yc2E..."

  module_enabled = true
}
```

## Example 8: Dynamic module_enabled

```hcl
module "conditional_subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.8.0/24"
  display_name   = "conditional-subnet"

  # Enable subnet only in production environment
  module_enabled = var.environment == "production"
}
```

## Example 9: Subnet with Tags

```hcl
module "subnet_with_tags" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id = "ocid1.compartment.oc1..example"
  vcn_id         = "ocid1.vcn.oc1..example"
  cidr_block     = "10.0.9.0/24"
  display_name   = "tagged-subnet"

  freeform_tags = {
    Environment = "Production"
    Department  = "Engineering"
    Project     = "Terraform-OCI"
  }

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "terraform"
    "Oracle-Tags.CreatedOn" = "2024-01-01"
  }

  module_enabled = true
}
```

## Example 10: Availability Domain Specific Subnet

```hcl
module "ad_specific_subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id      = "ocid1.compartment.oc1..example"
  vcn_id              = "ocid1.vcn.oc1..example"
  cidr_block          = "10.0.10.0/24"
  display_name        = "ad-subnet"
  availability_domain = "us-ashburn-1-AD-1"  # Specific AD

  module_enabled = true
}
```

## Example 11: Complete Configuration

```hcl
module "complete_subnet" {
  source = "github.com/hadenlabs/terraform-oci//modules/subnet"

  compartment_id             = "ocid1.compartment.oc1..example"
  vcn_id                     = "ocid1.vcn.oc1..example"
  cidr_block                 = "10.0.11.0/24"
  display_name               = "complete-subnet"
  availability_domain        = "us-ashburn-1-AD-1"
  route_table_id             = "ocid1.routetable.oc1..example"
  security_list_ids          = ["ocid1.securitylist.oc1..example"]
  prohibit_public_ip_on_vnic = false
  dns_label                  = "complete"

  freeform_tags = {
    Environment = "Development"
    Owner       = "DevOps"
  }

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "terraform-module"
  }

  module_enabled = true
}
```
