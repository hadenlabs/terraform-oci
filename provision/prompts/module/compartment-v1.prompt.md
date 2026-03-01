# Prompt: Crear módulo OCI – Compartment

## Contexto

Estás trabajando dentro del repositorio `terraform-oci`.

Debes cumplir estrictamente todas las reglas definidas en `AGENTS.md`. Si existe conflicto entre este prompt y `AGENTS.md`, prevalece `AGENTS.md`.

No se permite introducir nuevas convenciones arquitectónicas. El módulo debe replicar exactamente la arquitectura utilizada en:

modules/compute/

---

## Objetivo

Crear un módulo Terraform para el recurso:

`oci_identity_compartment`

Ubicación obligatoria:

```
modules/compartment/
```

El módulo debe seguir exactamente la arquitectura utilizada en:

```
modules/compute/
```

No se permite introducir nuevas convenciones estructurales.

---

# Arquitectura Obligatoria (main.tf)

Debe incluir:

## 1. locals con 4 bloques exactos

```
locals {
  defaults
  input
  generated
  outputs
}
```

No se permiten estructuras alternativas.

## 2. Resource

```hcl
resource "oci_identity_compartment" "this"
```

Debe:

- Usar `count = local.outputs.module_enabled ? 1 : 0`
- Consumir exclusivamente `local.outputs.*`

---

# Documentación (Sistema Gomplate Obligatorio)

El archivo `README.md` es generado automáticamente.

No debe escribirse manualmente.

La fuente de verdad es:

```
modules/compartment/README.yaml
```

Y la carpeta:

```
modules/compartment/docs/
```

---

## README.yaml

Debe seguir exactamente el patrón de `modules/compute/README.yaml`.

Cambios obligatorios:

```yaml
name: compartment

tags:
  - oci
  - terraform
  - compartment
```

La descripción debe explicar:

- Qué es un compartment en OCI
- Naturaleza jerárquica
- Organización de recursos
- Base para IAM
- Segmentación de costos

Debe incluir:

```yaml
usages:
  - modules/compartment/docs/usage.md

include:
  - modules/compartment/docs/include/terraform.md
```

---

## usage.md

Debe incluir:

1. Ejemplo básico
2. Ejemplo jerárquico (padre → hijo)
3. Ejemplo con enable_delete = false
4. Uso del output id como input en otro módulo

No inventar recursos inexistentes.

---

## include/terraform.md

Crear archivo vacío en:

modules/compartment/docs/include/terraform.md

---

# Especificación del Recurso

Requeridos:

- compartment_id (string)
- name (string)
- description (string)

Opcionales:

- defined_tags (map(string))
- freeform_tags (map(string))
- enable_delete (bool)

Configuración del módulo:

- module_enabled (bool, default = true)

---

# Estructura de Archivos Obligatoria

El módulo debe contener exactamente:

```
modules/compartment/
 ├── main.tf
 ├── variables.tf
 ├── outputs.tf
 ├── versions.tf
 ├── README.yaml
 ├── README.md  (archivo generado, no escribir manualmente)
 ├── docs/
 │    ├── usage.md
 │    └── include/
 │         └── terraform.md
 └── Taskfile.yml
```

No agregar archivos adicionales.

---

# Taskfile.yml (Regla Estricta)

El Taskfile debe estar correctamente referenciado al módulo compartment.

No debe contener referencias a `compute`.

Debe usar rutas:

```
modules/compartment/README.md
modules/compartment/README.yaml
./modules/compartment/...
```

Contenido obligatorio:

```yaml
---
version: "3"

vars:
  MODULE_PATH: modules/compartment

tasks:
  readme:
    run: once
    desc: Generate Readme
    silent: true
    cmds:
      - >-
        gomplate --file {{.README_TEMPLATE}} --out {{.MODULE_PATH}}/README.md --datasource config={{.MODULE_PATH}}/README.yaml --datasource includes={{.README_INCLUDES}}


  test:
    desc: test module
    silent: true
    cmds:
      - >-
        go test -race -v ./{{.MODULE_PATH}}/... -coverprofile cover.out -timeout 60m
```

---

# Validaciones Específicas para Compartment

El README debe incluir sección explícita sobre:

1. Nombres únicos dentro del compartment padre
2. Jerarquía de hasta 6 niveles
3. Imposibilidad de mover compartments
4. Uso de enable_delete
5. Uso de tenancy como raíz

---

# Formato de Respuesta Obligatorio

El agente debe responder en este orden:

1. Estructura del módulo
2. Contenido completo de cada archivo
3. Checklist de validación contra reglas
4. Comandos para probar el módulo

Cada archivo debe mostrarse en bloque de código separado con lenguaje correcto.

No resumir código. No omitir archivos. No explicar teoría innecesaria.
