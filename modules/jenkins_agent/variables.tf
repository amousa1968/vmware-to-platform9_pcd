variable "agent_name" {
  description = "Name of the Jenkins agent VM"
  type        = string
}

variable "image_name" {
  description = "Name of the image to use for the Jenkins agent"
  type        = string
}

variable "flavor_name" {
  description = "Name of the flavor to use for the Jenkins agent"
  type        = string
}

variable "key_pair" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the Jenkins agent"
  type        = list(string)
  default     = ["default"]
}

variable "network_name" {
  description = "Name of the network to attach the Jenkins agent to"
  type        = string
}

variable "jenkins_url" {
  description = "URL of the Jenkins master"
  type        = string
}

variable "agent_secret" {
  description = "Secret for Jenkins agent authentication"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment tag for the Jenkins agent"
  type        = string
  default     = "production"
}

variable "attach_volume" {
  description = "Whether to attach a volume to the Jenkins agent"
  type        = bool
  default     = false
}

variable "volume_id" {
  description = "ID of the volume to attach"
  type        = string
  default     = ""
}
