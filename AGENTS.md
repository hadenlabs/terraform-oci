# agents.md - Guía para Agentes de IA

## Información del Proyecto

**Nombre:** terraform-oci **Tipo:** Módulos de Terraform para Oracle Cloud Infrastructure (OCI) **Proveedor:** oracle/oci (v4.67.3+) **Versión de Terraform:** >= 1.0.0

## Estructura del Proyecto

```
terraform-oci/
├── .ci/                       # Configuración de CI/CD
│   ├── config/                # Configuraciones
│   └── linters/              # Configuraciones de linters
├── .github/                   # GitHub workflows y templates
├── modules/                   # Módulos de Terraform
│   ├── network/               # Redes (VCN, Subnets, Security Lists)
│   ├── compute/               # Instancias de compute
│   ├── database/             # Bases de datos
│   ├── object-storage/        # Object Storage
│   └── identity/             # IAM (Compartments, Groups)
├── examples/                  # Ejemplos de uso
│   └── basic/                 # Ejemplo básico
├── config/                    # Código Go
├── docs/                      # Documentación
├── test/                      # Tests
├── Taskfile.yml              # Comandos automatizados
├── pyproject.toml            # Configuración Python
├── go.mod                     # Módulos Go
└── package.json              # Dependencias Node
```

## Recursos OCI Soportados

El proveedor `oracle/oci` soporta más de 100 servicios. Los recursos principales incluyen:

### Core Services (Networking, Compute, Block Volume)

- `oci_core_vcn` - Virtual Cloud Network
- `oci_core_subnet` - Subnets
- `oci_core_security_list` - Security Lists
- `oci_core_route_table` - Route Tables
- `oci_core_instance` - Compute Instances
- `oci_core_volume` - Block Volumes
- `oci_core_boot_volume` - Boot Volumes

### Identity

- `oci_identity_compartment` - Compartments
- `oci_identity_group` - Groups
- `oci_identity_user` - Users
- `oci_identity_policy` - Policies

### Database

- `oci_database_db_system` - Database Systems
- `oci_database_autonomous_database` - Autonomous Database

### Object Storage

- `oci_objectstorage_bucket` - Buckets
- `oci_objectstorage_object` - Objects

### Otros Servicios

- `oci_file_storage_file_system` - File Storage
- `oci_load_balancer_load_balancer` - Load Balancers
- `oci_containerengine_cluster` - Kubernetes clusters
- `oci_bastion_bastion` - Bastion service

## Provider Configuration

```hcl
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}
```

## Variables Comunes

### Requeridas:

- `tenancy_ocid` (string) - OCID del tenancy
- `region` (string) - Región de OCI (ej: us-ashburn-1)

### Opcionales:

- `compartment_ocid` (string) - OCID del compartment (default: tenancy_ocid)

## Comandos Principales

```bash
# Setup e instalación
task setup                     # Instalar todas las dependencias
task environment               # Configurar entorno de desarrollo

# Terraform
task terraform:fmt             # Formatear código Terraform
task terraform:validate        # Validar configuración
task terraform:plan            # Planificar cambios

# Desarrollo
task generate                  # Generar archivos
task prettier                  # Formatear código

# Testing
task test                      # Ejecutar tests de Go

# Documentación
task readme                    # Generar README
task docs                      # Generar documentación

# Ver tareas disponibles
task -l
```

## Ejemplo de Uso

```hcl
# Configurar provider
provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..xxxxx"
  user_ocid        = "ocid1.user.oc1..xxxxx"
  private_key_path = "~/.oci/oci_api_key.pem"
  fingerprint      = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
  region           = "us-ashburn-1"
}

# Crear compartment
module "compartment" {
  source = "./modules/identity/compartment"

  name           = "my-compartment"
  description   = "Compartment for my resources"
  compartment_id = var.tenancy_ocid
}

# Crear VCN
module "network" {
  source = "./modules/network/vcn"

  cidr_block     = "10.0.0.0/16"
  compartment_id = module.compartment.compartment_id
  region         = "us-ashburn-1"
}
```

## Recursos Clave

- **Terraform Registry (OCI):** https://registry.terraform.io/providers/oracle/oci/latest
- **Documentación OCI:** https://docs.oracle.com/en-us/iaas/Content/dev/terraform/supported-services.htm
- **Tutoriales:** https://developer.hashicorp.com/terraform/tutorials/oci-get-started

## Notas para Agentes

- Usar provider `oracle/oci` (no hashicorp/oci)
- Siempre usar `sensitive = true` para claves y passwords
- Usar conditional resources con `count = var.module_enabled ? 1 : 0`
- Incluir descripciones en todas las variables y outputs
- Usar Taskfile para comandos automatizados
- Este proyecto crea módulos reutilizables para diferentes servicios de OCI
