locals {
  vmid       = 104
  cpu_cores  = 1
  memory     = 1536
  disk_size  = "60G"
  hostname   = "vpn-p01"
  ip_address = "192.168.1.104"
  tags       = "prod"
  connection = {
    type        = "ssh"
    user        = "perim.labz.tr"
    private_key = file("~/.ssh/id_rsa")
    host        = local.ip_address
  }
}

module "create-vm" {
  source              = "../../modules/vm" 
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  target_node         = var.target_node
  storage             = var.storage

  hostname            = local.hostname
  ip_address          = local.ip_address
  gateway             = var.gateway
  tags                = local.tags

  vmid                = local.vmid
  cpu_cores           = local.cpu_cores
  memory              = local.memory
  disk_size           = local.disk_size

  user                = local.connection.user
  private_key         = local.connection.private_key
  ssh_keys            = var.ssh_keys
  clone_template      = var.clone_template
}
