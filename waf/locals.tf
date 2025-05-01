
locals {
  tags = {
    Env        = var.env
    Project    = var.project
    Owner      = var.owner
    Repository = var.repository
    Script     = "terraform"
  }
}