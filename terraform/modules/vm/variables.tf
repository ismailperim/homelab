variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
}

variable "vmid" {
  description = "ID number of VM"
  type        = number
}
variable "hostname" {
  description = "Hostname of the VM"
  type        = string
}

variable "target_node" {
  description = "Target Proxmox node to create VM"
  type        = string
}

variable "storage" {
  description = "Proxmox storage to use for VM disks"
  type        = string
}

variable "ip_address" {
  description = "IP address of the VM"
  type        = string
}

variable "gateway" {
  description = "Gateway address"
  type        = string
}

variable "cpu_cores" {
  description = "CPU Cores"
  type        = number
}

variable "cpu_sockets" {
  description = "CPU Sockets"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory Size in MB"
  type        = number
  default     = 1024
}

variable "disk_size" {
  description = "Disk Size in GB (ex. 10G)"
  type        = string
  default     = "20G"
}

variable "clone_template" {
  description = "Proxmox template name for clone"
  type        = string
}

variable "user" {
  description = "User for SSH connections"
  type        = string
  default     = "perim.labz.tr"
}

variable "private_key" {
  description = "Private key for SSH connections"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "ssh_keys" {
  description = "List of SSH public keys to be added to the VM"
  type        = list(string)
}

variable "provision_commands" {
  description = "List of commands for provisioning after VM up"
  type        = list(string)
  default     = []
}
