resource "openstack_networking_secgroup_v2" "terraform_sec_group" {
  name        = "secgroup_1"
  description = "My neutron security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.terraform_sec_group.id
}

resource "openstack_networking_network_v2" "net-iiks8" {
  name           = var.priv_network
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "priv_subnet" {
  name       = "priv_subnet"
  network_id = openstack_networking_network_v2.net-iiks8.id
  cidr       = "192.168.250.0/24"
  ip_version = 4
}

resource "openstack_compute_instance_v2" "vm-terraform-1" {
  name        = "vm-terraform-1"
  image_name  = var.image
  flavor_name = var.flavor
  network {
    name = var.pub_network
  }
  network {
    name = openstack_networking_network_v2.net-iiks8.name
  }
  depends_on = [ openstack_networking_subnet_v2.priv_subnet ]
}

resource "openstack_compute_instance_v2" "vm-terraform-2" {
  name        = "vm-terraform-2"
  image_name  = var.image
  flavor_name = var.flavor
  network {
    name = openstack_networking_network_v2.net-iiks8.name
  }
  depends_on = [ openstack_networking_subnet_v2.priv_subnet ]
}
