variable env {
  type    = string
  default = "test"
}

variable location-name {
  type    = string
  default = "westeurope"
}

variable resource-group-name {
  type    = string
  default = "terraform-rg-hgfv"
}

variable key-vault-name {
  type    = string
  default = "kvult-hgfv"
}

variable storage-name {
  type    = string
  default = "storagehgfv"
}

variable service-plan {
  type    = string
  default = "service-plan"
}

variable site-name {
  type    = string
  default = "#{site-name}#"
}

variable container-name {
  type    = string
  default = "tfstate"
}

variable tfstate-name {
  type    = string
  default = "tfstate"
}