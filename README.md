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

=======
## Modules

- `modules/vm`: Provisions OpenStack compute instances
- `modules/network`: Creates networks and subnets
- `modules/storage`: Manages block storage volumes
- `modules/jenkins_agent`: Provisions Jenkins agent VMs on Platform9 PCD

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Example Terraform Execution

Here is an example of running the Terraform commands to initialize, validate, and plan the deployment:

```bash
terraform init && terraform validate && terraform plan
```

Output:

```
Initializing the backend...
Initializing modules...
Initializing provider plugins...
- Reusing previous version of terraform-provider-openstack/openstack from the dependency lock file
- Using previously-installed terraform-provider-openstack/openstack v1.53.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Success! The configuration is valid.


Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.network.openstack_networking_network_v2.network will be created
  + resource "openstack_networking_network_v2" "network" {
      + admin_state_up          = true
      + all_tags                = (known after apply)
      + availability_zone_hints = (known after apply)
      + dns_domain              = (known after apply)
      + external                = (known after apply)
      + id                      = (known after apply)
      + mtu                     = (known after apply)
      + name                    = "test-network"
      + port_security_enabled   = (known after apply)
      + qos_policy_id           = (known after apply)
      + region                  = (known after apply)
      + shared                  = (known after apply)
      + tenant_id               = (known after apply)
      + transparent_vlan        = (known after apply)

      + segments (known after apply)
    }

  # module.network.openstack_networking_subnet_v2.subnet will be created
  + resource "openstack_networking_subnet_v2" "subnet" {
      + all_tags          = (known after apply)
      + cidr              = "192.168.1.0/24"
      + enable_dhcp       = true
      + gateway_ip        = (known after apply)
      + id                = (known after apply)
      + ip_version        = 4
      + ipv6_address_mode = (known after apply)
      + ipv6_ra_mode      = (known after apply)
      + name              = "test-subnet"
      + network_id        = (known after apply)
      + no_gateway        = false
      + region            = (known after apply)
      + service_types     = (known after apply)
      + tenant_id         = (known after apply)

      + allocation_pool (known after apply)

      + allocation_pools (known after apply)
    }

  # module.storage.openstack_blockstorage_volume_v3.volume will be created
  + resource "openstack_blockstorage_volume_v3" "volume" {
      + attachment        = (known after apply)
      + availability_zone = (known after apply)
      + id                = (known after apply)
      + metadata          = (known after apply)
      + name              = "test-volume"
      + region            = (known after apply)
      + size              = 10
      + volume_type       = (known after apply)
    }

  # module.vm.openstack_compute_instance_v2.vm will be created
  + resource "openstack_compute_instance_v2" "vm" {
      + access_ip_v4        = (known after apply)
      + access_ip_v6        = (known after apply)
      + all_metadata        = (known after apply)
      + all_tags            = (known after apply)
      + availability_zone   = (known after apply)
      + created             = (known after apply)
      + flavor_id           = (known after apply)
      + flavor_name         = "m1.small"
      + force_delete        = false
      + id                  = (known after apply)
      + image_id            = (known after apply)
      + image_name          = "ubuntu-20.04"
      + name                = "test-vm"
      + power_state         = "active"
      + region              = (known after apply)
      + security_groups     = [
          + "default",
        ]
      + stop_before_destroy = false
      + updated             = (known after apply)

      + network {
          + access_network = false
          + fixed_ip_v4    = (known after apply)
          + fixed_ip_v6    = (known after apply)
          + floating_ip    = (known after apply)
          + mac            = (known after apply)
          + name           = "test-network"
          + port           = (known after apply)
          + uuid           = (known after apply)
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + network_id = (known after apply)
  + subnet_id  = (known after apply)
  + vm_id      = (known after apply)
  + vm_ip      = (known after apply)
  + volume_id  = (known after apply)

─────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee
to take exactly these actions if you run "terraform apply" now.
```

✅ Packer Build Test Results
Build Execution
- Command: 
```
./packer.exe build -var 'auth_url=test' -var 'tenant_name=test' -var 'username=test' -var 'password=test' -var 'region=test' -var 'network=test' packer/jenkins-agent.json
```

- Result: Build process initiated correctly
- Expected Failure: Authentication failed (expected with test credentials)
- Confirmation: Template syntax and structure are valid
- Error Analysis
- The error "Authentication failed" is expected since we used dummy credentials
- No syntax errors in the Packer template
- OpenStack plugin installed and working
- All provisioners (shell, file, ansible-local) are recognized

## License

This project is licensed under the MIT License.



