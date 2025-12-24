terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~>1.53.0"
    }
  }
}

provider "openstack" {
  auth_url    = var.auth_url
  user_name   = var.user_name
  password    = var.password
  tenant_name = var.tenant_name
  region      = var.region
}

module "vm" {
  source = "./modules/vm"

  vm_name         = var.vm_name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  network_name    = var.network_name
  security_groups = var.security_groups
}

module "network" {
  source = "./modules/network"

  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "storage" {
  source = "./modules/storage"

  volume_name = var.volume_name
  size        = var.size
}
