terraform {
  required_providers {
    proxmox = {
      source  = "MaartendeKruijf/proxmox"
      version = "0.0.1"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
}

module "server-app-p01" {
  source              = "./servers/app-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}

module "server-app-p02" {
  source              = "./servers/app-p02"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}
