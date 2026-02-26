# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "tenancy_ocid" {
  description = "OCID del tenancy de OCI"
  type        = string
}

variable "user_ocid" {
  description = "OCID del usuario en OCI"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint de la clave pública configurada en OCI"
  type        = string
}

variable "private_key_path" {
  description = "Ruta local al archivo PEM de la clave privada"
  type        = string
  default     = "~/.oci/oci_api_key.pem"
}

variable "region" {
  description = "Región donde se van a crear los recursos de OCI"
  type        = string
  default     = "us-ashburn-1"
}


# core instance

variable "compartment_ocid" {
  description = "OCID del compartimiento donde crear la instancia"
  type        = string
}

variable "availability_domain" {
  description = "Dominio de disponibilidad donde lanzar la instancia"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID de la subred para la instancia"
  type        = string
}

variable "image_ocid" {
  description = "OCID de la imagen base (ej: Oracle Linux)"
  type        = string
}

variable "shape" {
  description = "Shape de la instancia (ej: VM.Standard.E2.1.Micro)"
  type        = string
  default     = "VM.Standard.E2.1.Micro"
}

variable "ssh_public_key" {
  description = "Clave pública SSH para acceso a la instancia"
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have defaults, but may be overridden.
# ----------------------------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# See https://medium.com/mineiros/the-ultimate-guide-on-how-to-write-terraform-modules-part-1-81f86d31f024
# ----------------------------------------------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether to create resources within the module or not. Default is true."
  default     = true
}
