# Prompt: Crear test Terratest para el módulo OCI – Compartment

## Contexto

Estás trabajando dentro del repositorio `terraform-oci`.

Debes cumplir estrictamente todas las reglas definidas en `AGENTS.md`. Si existe conflicto entre este prompt y `AGENTS.md`, prevalece `AGENTS.md`.

El módulo `compartment` ya existe en:

modules/compartment/

Este prompt es exclusivamente para agregar tests.

NO debes modificar:

- modules/compartment/main.tf
- modules/compartment/variables.tf
- modules/compartment/outputs.tf
- modules/compartment/versions.tf
- README.yaml
- README.md
- Taskfile.yml
- provision/generators/README.yaml

---

# Arquitectura de Testing del Proyecto

El proyecto usa:

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
- Extender testutil siguiendo el mismo patrón usado por compute

No se permite:

- Introducir dependencias externas nuevas
- Modificar la arquitectura de testing existente

---

# Objetivo

Crear un test básico de éxito para el módulo:

modules/compartment/

Debe replicar exactamente el patrón utilizado en:

modules/compute/test/

- No se permiten nuevas convenciones.
- No simplificar estructura.
- No eliminar archivos.
- No agregar archivos adicionales.

---

# Ubicación y Estructura Obligatoria

Debe replicarse exactamente la estructura utilizada en:

modules/compute/test/compute-basic/

Estructura final:

```bash
modules/compartment/
  └── test/
    ├── compartment_basic_test.go
    └── compartment-basic/
      ├── main.tf
      ├── variables.tf
      ├── outputs.tf
      └── versions.tf
```

La estructura debe ser idéntica a compute-basic.

---

# Generación de Datos

Debe crearse una función:

internal/testutil/oci/compartment.go

Con la función:

    func NewCompartment() *Compartment

La estructura debe contener:

- Name
- Description

Esta función debe:

- Usar internal/app/external/faker para generar:
  - name único
  - description dinámico
- Obtener ParentCompartmentID desde la configuración base utilizada por compute

- No se permite hardcodear valores.
- No se permite modificar faker.

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

- name (NewCompartment().Name)
- description (NewCompartment().Description)

Opcionales:

- enable_delete (true)
- freeform_tags ({})
- defined_tags ({})

Configuración obligatoria:

- module_enabled = true

---

# Archivo: compartment-basic/main.tf

Debe:

- Instanciar el módulo usando:

  source = "../../"

- Pasar todas las variables
- No crear recursos adicionales
- No declarar proveedores adicionales

Debe exponer como outputs:

- module_enabled
- compartment_id
- name

No agregar outputs inexistentes.

---

# Validaciones Obligatorias

El test debe validar:

1. module_enabled == "true"
2. compartment_id no vacío
3. name igual al generado por NewCompartment()

---

# Formato de Respuesta Obligatorio

El agente debe responder en este orden:

1. Estructura final del test
2. Contenido completo de:
   - internal/testutil/oci/compartment.go
   - compartment_basic_test.go
   - compartment-basic/main.tf
   - compartment-basic/variables.tf
   - compartment-basic/outputs.tf
   - compartment-basic/versions.tf
3. Checklist de cumplimiento
4. Comandos para ejecutar el test

- No resumir código.
- No omitir archivos.
- No explicar teoría innecesaria.
