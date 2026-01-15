terraform {
  required_providers {
    proxmox = {
      source  = "MaartendeKruijf/proxmox"
      version = "0.0.1"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "labztr" 
    workspaces {
      name = "homelab"
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

module "server-dns-p01" {
  source              = "./servers/dns-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}

module "server-iot-p01" {
  source              = "./servers/iot-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}

module "server-vpn-p01" {
  source              = "./servers/vpn-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}

module "server-ops-p01" {
  source              = "./servers/ops-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}

module "server-pbx-p01" {
  source              = "./servers/pbx-p01"
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  gateway             = var.gateway
  storage             = var.storage
  clone_template      = var.clone_template
  ssh_keys            = var.ssh_keys
}