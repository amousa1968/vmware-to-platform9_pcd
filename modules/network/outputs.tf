output "network_id" {
  description = "ID of the created network"
  value       = openstack_networking_network_v2.network.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = openstack_networking_subnet_v2.subnet.id
}
