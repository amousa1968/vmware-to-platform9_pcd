terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~>1.53.0"
    }
  }
}

resource "openstack_compute_instance_v2" "vm" {
  name            = var.vm_name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  security_groups = var.security_groups

  network {
    name = var.network_name
  }
}
