output "jenkins_agent_id" {
  description = "ID of the Jenkins agent VM"
  value       = openstack_compute_instance_v2.jenkins_agent.id
}

output "jenkins_agent_ip" {
  description = "IP address of the Jenkins agent VM"
  value       = openstack_compute_instance_v2.jenkins_agent.access_ip_v4
}

output "jenkins_agent_name" {
  description = "Name of the Jenkins agent VM"
  value       = openstack_compute_instance_v2.jenkins_agent.name
}
