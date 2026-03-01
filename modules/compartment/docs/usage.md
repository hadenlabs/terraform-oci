# How to use this Module

## Basic Example

Create a simple compartment in the tenancy root:

```hcl
module "development" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "development"
  description    = "Development environment compartment"
  module_enabled = true
}
```

## Hierarchical Structure Example

Create nested compartments for a multi-tier application:

```hcl
# Root compartment for the application
module "app_root" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "my-application"
  description    = "Main application compartment"
  module_enabled = true
}

# Network compartment
module "network" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = module.app_root.compartment_id
  name           = "network"
  description    = "Network resources compartment"
  module_enabled = true
}

# Compute compartment
module "compute" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = module.app_root.compartment_id
  name           = "compute"
  description    = "Compute resources compartment"
  module_enabled = true
}

# Database compartment
module "database" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = module.app_root.compartment_id
  name           = "database"
  description    = "Database resources compartment"
  module_enabled = true
}
```

## Compartment with Protection (enable_delete = false)

Create a compartment that cannot be deleted through Terraform:

```hcl
module "production" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "production"
  description    = "Production environment - protected from accidental deletion"
  enable_delete  = false
  module_enabled = true
}
```

## Compartment with Tags

Create a compartment with organizational tags:

```hcl
module "finance_department" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "finance"
  description    = "Finance department compartment"

  freeform_tags = {
    "Department" = "Finance"
    "CostCenter" = "FIN-001"
    "Owner"      = "finance-team@example.com"
  }

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "terraform"
    "Oracle-Tags.CreatedOn" = "2024-01-01"
  }

  module_enabled = true
}
```

## Using Compartment Output in Other Modules

Use the compartment ID as input for other resources:

```hcl
# Create compartment
module "development_env" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "development"
  description    = "Development environment"
  module_enabled = true
}

# Create VCN in the compartment
module "development_vcn" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/network/vcn?ref=0.0.0"

  compartment_id = module.development_env.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "development-vcn"
  module_enabled = true
}

# Create compute instance in the compartment
module "development_instance" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compute?ref=0.0.0"

  compartment_id      = module.development_env.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard.E4.Flex"
  subnet_id           = module.development_vcn.subnet_id
  display_name        = "dev-instance-01"
  image_id            = var.image_id
  ssh_public_key      = var.ssh_public_key
  module_enabled      = true
}
```

## Module Disabled Example

Conditionally create compartment based on environment:

```hcl
module "staging" {
  source = "git::https://github.com/hadenlabs/terraform-oci.git//modules/compartment?ref=0.0.0"

  compartment_id = var.tenancy_ocid
  name           = "staging"
  description    = "Staging environment compartment"
  module_enabled = var.create_staging_environment
}
```

## Important Notes

1. **Unique Names**: Compartment names must be unique within the parent compartment.
2. **Hierarchy Limits**: OCI supports up to 6 levels of nested compartments.
3. **Immutable Structure**: Compartments cannot be moved to different parent compartments after creation.
4. **Deletion Protection**: When `enable_delete = false`, compartments must be manually deleted before Terraform destroy operations.
5. **Tenancy as Root**: Use the tenancy OCID (`var.tenancy_ocid`) as `compartment_id` for root-level compartments.
6. **State Management**: Compartment state changes (ACTIVE/DELETED) are managed by OCI and reflected in the `state` output.
