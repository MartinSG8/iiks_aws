terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

provider "openstack" {
  user_name        = "iiks8"
  tenant_name      = "iiks8"
  password         = "integracia"
  insecure         = "true"
  auth_url         = "https://158.193.152.44:5000/v3/"
  region           = "RegionOne"
  user_domain_name = "admin_domain"

  endpoint_overrides = {
    "network"  = "https://158.193.152.44:9696/v2.0/"
    "compute"  = "https://158.193.152.44:8774/v2.1/"
    "identity" = "https://158.193.152.44:5000/v3/"
    "image"    = "https://158.193.152.44:9292/"
  }
}
