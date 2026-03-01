# Prompt: Crear test Terratest para el módulo OCI – Compartment

## Contexto

Estás trabajando dentro del repositorio `terraform-oci`.

Debes cumplir estrictamente todas las reglas definidas en `AGENTS.md`. Si existe conflicto entre este prompt y `AGENTS.md`, prevalece `AGENTS.md`.

El módulo `compartment` ya existe en:

modules/compartment/

Este prompt es exclusivamente para agregar tests.

NO debes modificar:

- main.tf
- variables.tf
- outputs.tf
- versions.tf
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

- No se permite introducir nuevas dependencias.
- No se permite crear nuevos helpers.
- No se permite modificar testutil o faker.

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

La estructura final debe ser:

modules/compartment/ └── test/ ├── compartment_basic_test.go └── compartment-basic/ ├── main.tf ├── variables.tf ├── outputs.tf └── versions.tf

- No simplificar la carpeta `compartment-basic`.
- No dejar solo main.tf.
- No agregar data.tf si compute no lo usa.
- La estructura debe ser idéntica a compute-basic.

---

# Generación de Datos (Regla Estricta)

Debe replicarse exactamente el patrón de generación de datos utilizado en compute.

Debe usarse:

- internal/testutil/oci para obtener:
  - compartment_id base para crear el nuevo compartment

- internal/app/external/faker para generar:
  - name único por ejecución
  - description dinámico

No se permite:

- Hardcodear strings
- Inventar funciones inexistentes (ej: NewCompartment si no existe)
- Crear nuevos helpers
- Modificar faker
- Modificar testutil

Si compute usa un objeto base (ej: oci.NewCompute()) para obtener compartment_id, debe replicarse el mismo patrón para obtener el compartment_id requerido.

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
- Usar assert.NotEmpty cuando corresponda

No usar otros frameworks.

---

# Variables que debe enviar el Test

Requeridas:

- compartment_id
- name
- description

Opcionales (si el módulo los soporta):

- enable_delete
- freeform_tags
- defined_tags

Configuración obligatoria:

- module_enabled = true

---

# Archivo: compartment-basic/main.tf

Debe:

- Instanciar el módulo usando:

  source = "../../"

- Pasar todas las variables recibidas
- No crear recursos adicionales
- No usar otros módulos
- No declarar proveedores adicionales
- Solo probar el módulo

Debe exponer como outputs:

- module_enabled
- id
- name

No agregar outputs no existentes en el módulo.

---

# Validaciones Obligatorias

El test debe validar estrictamente:

1. module_enabled == "true"
2. id no vacío
3. name igual al generado por faker

- No validar comportamiento no implementado.
- No validar lógica interna no expuesta por outputs.

---

# Formato de Respuesta Obligatorio

El agente debe responder en este orden:

1. Estructura final del test
2. Contenido completo de:
   - compartment_basic_test.go
   - compartment-basic/main.tf
   - compartment-basic/variables.tf
   - compartment-basic/outputs.tf
   - compartment-basic/versions.tf
3. Checklist de cumplimiento de arquitectura de testing
4. Comandos para ejecutar el test

Cada archivo debe mostrarse en bloque de código separado con lenguaje correcto.

- No resumir código.
- No omitir archivos.
- No explicar teoría innecesaria.
