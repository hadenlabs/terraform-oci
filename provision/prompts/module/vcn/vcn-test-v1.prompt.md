# Prompt: Crear test Terratest para el módulo OCI – VCN

## Contexto

Estás trabajando dentro del repositorio `terraform-oci`.

Debes cumplir estrictamente todas las reglas definidas en `AGENTS.md`. Si existe conflicto entre este prompt y `AGENTS.md`, prevalece `AGENTS.md`.

El módulo `vcn` ya existe en:

```
modules/vcn/
```

Este prompt es exclusivamente para agregar tests.

NO debes modificar:

- modules/vcn/main.tf
- modules/vcn/variables.tf
- modules/vcn/outputs.tf
- modules/vcn/versions.tf
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
modules/vcn/
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
modules/vcn/
  └── test/
    ├── vcn_basic_test.go
    └── vcn-basic/
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
internal/testutil/oci/vcn.go
```

Con la función:

```go
func NewVCN() *VCN
```

La estructura debe contener:

- DisplayName
- CIDRBlocks
- CompartmentID

Esta función debe:

- Usar internal/app/external/faker para generar:
  - display_name único

- Generar CIDRBlocks válidos (no hardcodeados repetidos)
- Obtener CompartmentID desde la configuración base utilizada por compute

No se permite:

- Hardcodear valores estáticos
- Introducir lógica externa nueva

Debe seguir el mismo patrón estructural usado por compute y compartment.

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

---

# Variables que debe enviar el Test

Requeridas:

- compartment_id (NewVCN().CompartmentID)
- cidr_blocks (NewVCN().CIDRBlocks)
- display_name (NewVCN().DisplayName)

Opcionales (si el módulo los soporta):

- dns_label
- freeform_tags ({})
- defined_tags ({})
- is_ipv6enabled (false)

Configuración obligatoria:

- module_enabled = true

---

# Archivo: vcn-basic/main.tf

Debe:

- Instanciar el módulo usando:

```hcl
source = "../../"
```

- Pasar todas las variables
- No crear recursos adicionales
- No declarar proveedores adicionales

Debe exponer como outputs:

- module_enabled
- vcn_id (el output del módulo debe llamarse vcn_id)
- display_name

No agregar outputs inexistentes.

---

# Validaciones Obligatorias

El test debe validar:

1. module_enabled == "true"
2. vcn_id no vacío
3. display_name igual al generado por NewVCN()

- No validar comportamiento no implementado.
- No validar lógica interna no expuesta por outputs.

---

# Formato de Respuesta Obligatorio

El agente debe responder en este orden:

1. Estructura final del test
2. Contenido completo de:
   - internal/testutil/oci/vcn.go
   - vcn_basic_test.go
   - vcn-basic/main.tf
   - vcn-basic/variables.tf
   - vcn-basic/outputs.tf
   - vcn-basic/versions.tf

3. Checklist de cumplimiento de arquitectura de testing
4. Comandos para ejecutar el test

```bash
task validate
```

Cada archivo debe mostrarse en bloque de código separado con lenguaje correcto.

- No resumir código.
- No omitir archivos.
- No explicar teoría innecesaria.
