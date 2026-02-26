variable "zone" {
  type        = string
  description = "name of zone e.g. 'domain.dev' or 'domain.com'"
}

variable "zone_id" {
  type        = string
  description = "The id of the DNS zone, e.g. 'domain.dev' or 'domain.com'."
}

variable "account_id" {
  type        = string
  description = "The (string) value of the account id"
}

variable "name" {
  type        = string
  description = "The alias email address to match (e.g. 'contact')."
}

variable "email" {
  type        = string
  description = "The full email address to match (e.g. contact@domain.com)."
}

variable "destination_email" {
  type        = list(string)
  description = "List of destination email addresses to forward to."
}