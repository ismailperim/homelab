locals {
  connection = {
    type        = "ssh"
    user        = var.user
    private_key = var.private_key
    host        = var.ip_address
  }
}

terraform {
  required_providers {
    proxmox = {
      source  = "MaartendeKruijf/proxmox"
      version = "0.0.1"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  vmid        = var.vmid
  name        = var.hostname
  target_node = var.target_node
  clone       = var.clone_template
  storage     = var.storage
  qemu_os     = "other"
  tags        = var.tags

  cores   = var.cpu_cores
  sockets = var.cpu_sockets
  memory  = var.memory
  scsihw  = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }


  ipconfig0 = "ip=${var.ip_address}/24,gw=${var.gateway}"
  sshkeys   = join("\n", var.ssh_keys)

  ciuser = var.user

  os_type = "cloud-init"

  provisioner "remote-exec" {
    inline = [
      "curl -X PUT -k -H \"Authorization: PVEAPIToken=${var.pm_api_token_id}=${var.pm_api_token_secret}\" -d disk=scsi0 -d size=${var.disk_size} \"${var.pm_api_url}/nodes/${var.target_node}/qemu/${var.vmid}/resize\"",
      "sleep 5",
      "sudo apt-get update",
      "sudo growpart /dev/sda 1",
      "sudo resize2fs /dev/sda1"
    ]

    connection {
      type        = local.connection.type
      user        = local.connection.user
      private_key = local.connection.private_key
      host        = var.ip_address
    }
  }

}

resource "null_resource" "provision_vm" {

  count = length(var.provision_commands) > 0 ? 1 : 0

  provisioner "remote-exec" {
    inline = var.provision_commands

    connection {
      type        = local.connection.type
      user        = local.connection.user
      private_key = local.connection.private_key
      host        = var.ip_address
    }
  }

  depends_on = [proxmox_vm_qemu.vm]
}

