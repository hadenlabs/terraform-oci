module "main" {
  source            = "../.."
  zone              = var.zone
  zone_id           = var.zone_id
  account_id        = var.account_id
  name              = var.name
  email             = var.email
  destination_email = var.destination_email
}