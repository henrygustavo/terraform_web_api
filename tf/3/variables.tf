variable location-name {
  type    = string
  default = "westeurope"
}

variable resource-group-name {
  type    = string
  default = "terra-rg-hgfv"
}

variable key-vault-name {
  type    = string
  default = "kvult-01-hgfv"
}

variable secret-name {
  type    = string
  default = "admin-password"
}

variable secret-value {
  type    = string
  default = "123456"
}

variable storage-name {
  type    = string
  default = "remotesa01hgfv"
}

variable container-name {
  type    = string
  default = "tfstate"
}


variable tfstate-name {
  type    = string
  default = "backend-test.tfstate"
}