output "vm_id" {
  description = "ID of the created VM instance"
  value       = openstack_compute_instance_v2.vm.id
}

output "vm_ip" {
  description = "IP address of the VM"
  value       = openstack_compute_instance_v2.vm.access_ip_v4
}
