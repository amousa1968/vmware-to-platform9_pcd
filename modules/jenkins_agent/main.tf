resource "openstack_compute_instance_v2" "jenkins_agent" {
  name            = var.agent_name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = var.security_groups

  network {
    name = var.network_name
  }

  user_data = templatefile("${path.module}/cloud-init.sh.tpl", {
    jenkins_url  = var.jenkins_url
    agent_secret = var.agent_secret
    agent_name   = var.agent_name
  })

  metadata = {
    "jenkins_agent" = "true"
    "environment"   = var.environment
  }
}

resource "openstack_compute_volume_attach_v2" "jenkins_agent_volume" {
  count       = var.attach_volume ? 1 : 0
  instance_id = openstack_compute_instance_v2.jenkins_agent.id
  volume_id   = var.volume_id
}
