terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~>1.53.0"
    }
  }
}

resource "openstack_networking_network_v2" "network" {
  name           = var.network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = var.subnet_name
  network_id = openstack_networking_network_v2.network.id
  cidr       = var.subnet_cidr
  ip_version = 4
}
