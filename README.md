# VMware to Platform9 PCD Migration with Terraform

This Terraform project provides a modular approach to migrating resources from VMware to Platform9 PCD (Platform9 Managed Kubernetes) using OpenStack-compatible infrastructure.

## Overview

The project uses reusable modules to provision:
- Virtual Machines (VMs)
- Networks and Subnets
- Storage Volumes

All modules are designed to work with OpenStack-based environments like Platform9 PCD.

## Prerequisites

- Terraform v1.0 or later
- Access to a Platform9 PCD or OpenStack environment
- Appropriate credentials and permissions

## Usage

1. Clone this repository and navigate to the project directory:
   ```bash
   cd terraform/vmware-to-platform9_pcd
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Create a `terraform.tfvars` file with your specific values or provide them interactively.

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Variables

The following variables need to be configured. You can set them in a `terraform.tfvars` file or provide them during `terraform apply`.

| Variable | Description | Example Value |
|----------|-------------|---------------|
| auth_url | OpenStack authentication URL | https://example.com |
| user_name | OpenStack username | your_username |
| password | OpenStack password | your_password |
| tenant_name | OpenStack tenant name | your_tenant |
| region | OpenStack region | your_region |
| vm_name | Name of the VM | my-vm |
| image_name | Name of the image | ubuntu-20.04 |
| flavor_name | Name of the flavor | m1.small |
| network_name | Name of the network | my-network |
| subnet_name | Name of the subnet | my-subnet |
| subnet_cidr | CIDR block for the subnet | 192.168.1.0/24 |
| security_groups | List of security groups | ["default"] |
| volume_name | Name of the volume | my-volume |
| size | Size of the volume in GB | 10 |

## Important Note

When converting the code for production use, make sure to change and update the provider registry host from any mock or example URLs (like "example.com/mock/openstack") to the real provider and URL. The current configuration uses the official OpenStack provider: `terraform-provider-openstack/openstack`.

## Outputs

After successful deployment, the following outputs will be available:

- `vm_id`: ID of the created VM
- `vm_ip`: IP address of the VM
- `network_id`: ID of the created network
- `subnet_id`: ID of the created subnet
- `volume_id`: ID of the created volume

## Modules

- `modules/vm`: Provisions OpenStack compute instances
- `modules/network`: Creates networks and subnets
- `modules/storage`: Manages block storage volumes

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License.
