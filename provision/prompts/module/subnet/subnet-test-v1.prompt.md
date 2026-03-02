# Prompt: Crear test Terratest para el módulo OCI – Subnet

## Contexto

Estás trabajando dentro del repositorio `terraform-oci`.

Debes cumplir estrictamente todas las reglas definidas en `AGENTS.md`. Si existe conflicto entre este prompt y `AGENTS.md`, prevalece `AGENTS.md`.

El módulo `subnet` ya existe en:

```
modules/subnet/
```

Este prompt es exclusivamente para agregar tests.

NO debes modificar:

- modules/subnet/main.tf
- modules/subnet/variables.tf
- modules/subnet/outputs.tf
- modules/subnet/versions.tf
- README.yaml
- README.md
- Taskfile.yml
- provision/generators/README.yaml

---

# Arquitectura de Testing del Proyecto

El proyecto usa estrictamente:

## 1. Terratest

- github.com/gruntwork-io/terratest/modules/terraform
- github.com/stretchr/testify/assert

## 2. Test utilities internas

- internal/testutil/
- internal/testutil/oci/

## 3. Faker interno

- internal/app/external/faker/

Se permite:

- Crear nuevos helpers en internal/testutil/oci/
- Extender testutil siguiendo exactamente el patrón usado por compute

No se permite:

- Introducir dependencias externas nuevas
- Modificar la arquitectura de testing existente
- Modificar faker

---

# Objetivo

Crear un test básico de éxito para el módulo:

```
modules/subnet/
```

Debe replicar exactamente el patrón utilizado en:

```
modules/compute/test/
```

- No se permiten nuevas convenciones.
- No simplificar estructura.
- No eliminar archivos.
- No agregar archivos adicionales.

---

# Ubicación y Estructura Obligatoria

Debe replicarse exactamente la estructura utilizada en:

```
modules/compute/test/compute-basic/
```

Estructura final:

```bash
modules/subnet/
  └── test/
    ├── subnet_basic_test.go
    └── subnet-basic/
      ├── main.tf
      ├── variables.tf
      ├── outputs.tf
      └── versions.tf
```

La estructura debe ser idéntica a compute-basic.

---

# Generación de Datos

Debe crearse un helper:

```
internal/testutil/oci/subnet.go
```

Con la función:

```go
func NewSubnet() *Subnet
```

La estructura debe contener:

- DisplayName
- CIDRBlock
- CompartmentID
- VCNID

Esta función debe:

- Usar internal/app/external/faker para generar:
  - display_name único
- Generar CIDRBlock válido (no hardcodeado repetido)
- Obtener CompartmentID desde la configuración base utilizada por compute
- Obtener VCNID desde configuración base o helper existente

No se permite:

- Hardcodear valores estáticos
- Introducir lógica externa nueva
- Modificar faker

Debe seguir exactamente el mismo patrón estructural usado por compute, compartment y vcn.

---

# Estructura del Test (Go)

El test debe:

- Usar t.Parallel()
- Crear terraform.Options
- Usar Upgrade: true
- Usar defer terraform.Destroy
- Ejecutar terraform.InitAndApply
- Validar outputs con terraform.Output
- Usar assert.Equal
- Usar assert.NotEmpty

No usar otros frameworks.

---

# Variables que debe enviar el Test

Requeridas:

- compartment_id (NewSubnet().CompartmentID)
- vcn_id (NewSubnet().VCNID)
- cidr_block (NewSubnet().CIDRBlock)
- display_name (NewSubnet().DisplayName)

Opcionales (si el módulo los soporta):

- availability_domain
- route_table_id
- security_list_ids
- network_security_group_ids
- prohibit_public_ip_on_vnic (true/false)
- freeform_tags ({})
- defined_tags ({})
- dns_label

Configuración obligatoria:

- module_enabled = true

---

# Archivo: subnet-basic/main.tf

Debe:

- Instanciar el módulo usando:

```hcl
source = "../../"
```

- Pasar todas las variables
- No crear recursos adicionales
- No declarar proveedores adicionales
- No usar otros módulos

Debe exponer como outputs:

- module_enabled
- subnet_id (el output del módulo debe llamarse subnet_id)
- display_name

No agregar outputs inexistentes.

---

# Validaciones Obligatorias

El test debe validar estrictamente:

1. module_enabled == "true"
2. subnet_id no vacío
3. display_name igual al generado por NewSubnet()

- No validar comportamiento no implementado.
- No validar lógica interna no expuesta por outputs.

---

# Formato de Respuesta Obligatorio

El agente debe responder en este orden:

1. Estructura final del test
2. Contenido completo de:
   - internal/testutil/oci/subnet.go
   - subnet_basic_test.go
   - subnet-basic/main.tf
   - subnet-basic/variables.tf
   - subnet-basic/outputs.tf
   - subnet-basic/versions.tf
3. Checklist de cumplimiento de arquitectura de testing
4. Comandos para ejecutar el test

```bash
task validate
```

Cada archivo debe mostrarse en bloque de código separado con lenguaje correcto.

- No resumir código.
- No omitir archivos.
- No explicar teoría innecesaria.
