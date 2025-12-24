variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "image_name" {
  description = "Name of the base image"
  type        = string
}

variable "flavor_name" {
  description = "Flavor for the VM"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
}
