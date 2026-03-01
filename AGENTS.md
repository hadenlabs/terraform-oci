# AGENTS.md – Contexto del Proyecto para Agentes de IA

## Información General del Proyecto

**Nombre:** terraform-oci **Tipo:** Módulos reutilizables de Terraform para Oracle Cloud Infrastructure **Versión de Terraform:** >= 1.0.0 **Provider:** oracle/oci (v4.67.3+) **Framework de Testing:** Go + Terratest **Utilidades de Testing:** internal/testutil/oci (generadores de datos tipo faker)

---

## Propósito del Proyecto

Este repositorio provee:

- Módulos reutilizables de OCI en Terraform
- Testing automatizado utilizando Terratest
- Generadores de datos fake para aislamiento de pruebas
- Flujos de validación preparados para CI

El agente de IA debe ser capaz de:

- Generar nuevos módulos Terraform
- Generar suites de pruebas con Terratest
- Utilizar utilidades internas de faker para datos de prueba
- Garantizar consistencia estructural de los módulos
- Cumplir estrictamente las convenciones del proyecto

---

## Estructura del Proyecto

```
terraform-oci/
├── modules/                    # Módulos reutilizables
│   ├── network/
│   ├── compute/
│   ├── identity/
│   ├── database/
│   └── object-storage/
├── examples/                   # Ejemplos de uso
├── internal/
│   └── testutil/
│       └── oci/                # Generadores de datos fake
├── test/                       # Pruebas Terratest
├── docs/
├── Taskfile.yml
└── go.mod
```

---

## Convenciones de Desarrollo de Módulos

### Estructura Obligatoria por Módulo

Cada módulo debe contener:

```
main.tf
variables.tf
outputs.tf
README.md
LICENSE
auth.tf
data.tf
variables.tf
README.yaml
versions.tf
Taskfile.yml
./docs
./test
```

---

### Reglas para Variables

- Toda variable debe definir:
  - `description`
  - `type`

- Los valores sensibles deben incluir:

```hcl
sensitive = true
```

- No se permiten OCIDs ni regiones hardcodeadas.
- Se debe priorizar el uso de variables sobre valores constantes.

---

### Reglas para Outputs

- Todo output debe definir:
  - `description`
- Se deben exponer:
  - IDs de recursos creados
  - Atributos relevantes
  - La bandera `module_enabled`

---

## Patrón module_enabled (Obligatorio)

Todos los módulos deben implementar:

```hcl
variable "module_enabled" {
  description = "Indica si el módulo está habilitado"
  type        = bool
  default     = true
}
```

Todos los recursos deben usar:

```hcl
count = local.outputs.module_enabled ? 1 : 0
```

Y exponer:

```hcl
output "module_enabled" {
  value       = var.module_enabled
  description = "(Optional) Whether to create resources within the module or not. Default is true."
}
```

## versions.tf

Debe incluir:

```hcl
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.67.3"
    }
  }
}
```

---

## Arquitectura de Testing

Todos los módulos deben incluir cobertura con Terratest.

### Framework de Testing

- Go
- Terratest
- Testify
- Ejecución paralela usando `t.Parallel()`

---

### Uso Obligatorio de Faker Interno

Las pruebas deben utilizar las utilidades internas ubicadas en:

```
internal/testutil/oci
```

Ejemplo:

```go
compute := oci.NewCompute()

compartmentID := compute.CompartmentID
availabilityDomain := compute.AvailabilityDomain
displayName := compute.DisplayName
sshPublicKey := compute.SshPublicKey
shape := compute.Shape
```

Reglas obligatorias:

- No hardcodear OCIDs.
- No hardcodear availability domains.
- Usar display names generados dinámicamente.
- Garantizar aislamiento entre pruebas.

---

## Patrón Estándar de Terratest

Toda prueba debe seguir la siguiente estructura:

```go
t.Parallel()

terraformOptions := &terraform.Options{
    TerraformDir: "<example-folder>",
    Upgrade:      true,
    Vars: map[string]interface{}{
        ...
        "module_enabled": true,
    },
}

defer terraform.Destroy(t, terraformOptions)

terraform.InitAndApply(t, terraformOptions)

output := terraform.Output(t, terraformOptions, "<output_name>")

assert.Equal(t, "true", output)
```

Reglas obligatorias:

- Siempre ejecutar `defer terraform.Destroy`
- Siempre validar al menos un output
- No dejar infraestructura sin destruir
- Utilizar assertions

---

## Reglas de Seguridad

El agente debe:

- Marcar claves SSH y datos sensibles como `sensitive = true`
- No exponer secretos en outputs
- No imprimir claves privadas en logs
- No filtrar credenciales en pruebas

---

## Flujo para Agregar un Nuevo Módulo

Cuando el agente genere un nuevo módulo, debe:

1. Crear carpeta bajo `modules/<nombre>`
2. Crear:
   - `main.tf`
   - `variables.tf`
   - `outputs.tf`
   - `README.md`

3. Implementar el patrón `module_enabled`
4. Crear pruebas Terratest en `test/<nombre-modulo>/`
5. Utilizar faker interno
6. Validar con:

```
task terraform:fmt
```

---

## Reglas de Comportamiento del Agente

Al generar o modificar código, el agente debe:

- Seguir las convenciones existentes
- Usar snake_case para variables
- Mantener compatibilidad hacia atrás
- No romper interfaces públicas
- No modificar la configuración del provider dentro de los módulos
- No introducir dependencias implícitas entre módulos

---

## Acciones Prohibidas

El agente no debe:

- Hardcodear OCIDs del tenancy
- Omitir pruebas
- Crear recursos sin `module_enabled`
- Exponer secretos
- Modificar el provider en módulos internos

---

## Referencia Canónica

Se considera implementación válida aquella que:

- Usa `oci.NewCompute()`
- Usa `t.Parallel()`
- Usa `defer terraform.Destroy`
- Valida outputs mediante assertions

Referencia: `TestComputeBasicSuccess`
