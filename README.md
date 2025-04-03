
# HomeLab Documentation

## Repository Overview

This repository automates the setup and management of a personal homelab environment. It utilizes Ansible for configuration management and Terraform for infrastructure provisioning.

**GitHub Repository**: [HomeLab Repository](https://github.com/ismailperim/homelab)

The homelab setup uses a custom domain `labz.tr` for managing traffic securely over SSL. It includes:

- **1 Physical Server**: Running Proxmox as the hypervisor.
- **2 Virtual Machines (VMs)**:
  - **`app-p01`**: Hosts Docker services configured with Swarm and Portainer.
  - **`dns-p01`**: Dedicated to Pi-hole as a DNS server.
  - **`iot-p01`**: HomeAssistant server that works OS directly.
  - **`vpn-p01`**: Dedicated to VPN/Tunnel server that uses Pritunl.

VMs are provisioned using Terraform, while Ansible handles software installations and operational maintenance.

---

## Repository Structure

The repository is organized into the following directories and files:

```plaintext
homelab/
├── ansible/
│   ├── roles/
│   ├── inventories/
│   └── playbooks/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .gitignore
└── README.md
```

### 1. `ansible/` Directory

This directory contains Ansible configurations for managing the homelab environment.

- **`roles/`**: Contains Ansible roles for different services and configurations. Each role is modular and reusable.

- **`inventories/`**: Houses inventory files that define the hosts and groups for Ansible playbooks.

- **`playbooks/`**: Includes Ansible playbooks that orchestrate the deployment and configuration of services.

- **`README.md`**: Provides documentation specific to the Ansible configurations.

### 2. `terraform/` Directory

This directory contains Terraform configurations for provisioning infrastructure resources.

- **`main.tf`**: The primary Terraform configuration file defining the desired infrastructure state.

- **`variables.tf`**: Defines input variables for the Terraform configuration, allowing customization.

- **`outputs.tf`**: Specifies the outputs of the Terraform configuration, providing information about the provisioned resources.

- **`README.md`**: Offers documentation related to the Terraform configurations.

### 3. `.gitignore` File

Specifies files and directories for Git to ignore, ensuring that sensitive or unnecessary files are not tracked.

### 4. `todos.MD` File

A markdown file likely used to keep track of tasks, ideas, or notes related to the project.

---

## Services Overview

### Dashboard
Managed by **Homarr**, providing a user-friendly interface to access and manage homelab services.

### DNS Server
**Pi-hole** is configured on `dns-p01` for network-wide DNS and ad-blocking. It is integrated with Traefik for secure SSL-based access.

### Reverse Proxy
**Traefik** is running on `app-p01` to manage routing and SSL certificates. It also handles service discovery and metrics exposure.

### Monitoring
**Netdata** is used for real-time monitoring of system and service performance. It is deployed on `app-p01` with a central dashboard for aggregated insights.

**Gatus** is used for check service/host statuses. It is deployed on `app-p01` with a central dashboard for aggregated insights.

### Container Management
**Portainer** is running on `app-p01` for managing Docker services and stacks.

---

## Getting Started

### Prerequisites

- **Ansible**: Ensure Ansible is installed on your local machine.
- **Environment Variables**: The following environment variables must be set for Ansible playbooks to function correctly:
   - CLOUDFLARE_EMAIL: Your Cloudflare email address. This will also used for ACME
   - CLOUDFLARE_API_KEY: Your Cloudflare API key.

Example to set these variables:
```
export CLOUDFLARE_EMAIL="your-email@example.com"
export CLOUDFLARE_API_KEY="your-cloudflare-api-key"
```
- **Terraform**: Install Terraform to provision infrastructure resources.
- **Access Credentials**: Obtain necessary credentials for your infrastructure provider (e.g., AWS, GCP, Azure).

### Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/ismailperim/homelab.git
   cd homelab
   ```

2. **Review and Customize Configurations**:

   - **Ansible**: Navigate to the `ansible/` directory and review the inventory files and playbooks. Modify them as needed to fit your environment.
   - **Terraform**: In the `terraform/` directory, review the `.tf` files. Update the `variables.tf` file with values specific to your infrastructure provider and desired configuration.

3. **Provision Infrastructure with Terraform**:

   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

   This will provision the necessary infrastructure resources as defined in your Terraform configuration.

4. **Configure Services with Ansible**:

   ```bash
   cd ../ansible
   ansible-playbook playbooks/setup_app-p01.yml -i inventory/hosts.yml
   ```

   This command will execute the Ansible playbook to configure and deploy services on your provisioned infrastructure.

