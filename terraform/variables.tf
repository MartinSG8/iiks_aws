variable "image" {
  type    = string
  default = "cirros"
}

variable "flavor" {
  type    = string
  default = "1c05r1d"
}

variable "pub_network" {
  type    = string
  default = "ext-net-154"
}

variable "priv_network" {
  type    = string
  default = "net-iiks8"
}
