terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~>1.53.0"
    }
  }
}

resource "openstack_blockstorage_volume_v3" "volume" {
  name = var.volume_name
  size = var.size
}
