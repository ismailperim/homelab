variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true

}

variable "target_node" {
  description = "Target Proxmox node to create VMs"
  type        = string
}

variable "storage" {
  description = "Proxmox storage to use for VM disks"
  type        = string
}

variable "clone_template" {
  description = "Proxmox template name for clone"
  type        = string
}

variable "gateway" {
  description = "Gateway IP Address"
  type        = string
}

variable "dns_primary" {
  description = "Primary DNS Server Address"
  type        = string
}

variable "dns_scondary" {
  description = "Secondary DNS Server Address"
  type        = string
}

variable "ssh_keys" {
  description = "List of SSH public keys to be added to the VMs"
  type        = list(string)
  sensitive   = true
}
