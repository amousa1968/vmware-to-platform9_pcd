output "volume_id" {
  description = "ID of the created storage volume"
  value       = openstack_blockstorage_volume_v3.volume.id
}
