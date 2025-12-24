variable "auth_url" {
  description = "OpenStack authentication URL"
  type        = string
}

variable "user_name" {
  description = "OpenStack username"
  type        = string
}

variable "password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}

variable "tenant_name" {
  description = "OpenStack tenant name"
  type        = string
}

variable "region" {
  description = "OpenStack region"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "image_name" {
  description = "Name of the image"
  type        = string
}

variable "flavor_name" {
  description = "Name of the flavor"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
  default     = ["default"]
}

variable "volume_name" {
  description = "Name of the volume"
  type        = string
}

variable "size" {
  description = "Size of the volume in GB"
  type        = number
}
