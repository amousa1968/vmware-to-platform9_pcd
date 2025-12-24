output "vm_id" {
  description = "ID of the created VM"
  value       = module.vm.vm_id
}

output "vm_ip" {
  description = "IP address of the VM"
  value       = module.vm.vm_ip
}

output "network_id" {
  description = "ID of the created network"
  value       = module.network.network_id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = module.network.subnet_id
}

output "volume_id" {
  description = "ID of the created volume"
  value       = module.storage.volume_id
}
