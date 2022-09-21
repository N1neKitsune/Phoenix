terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "node" {
  name      = "${var.name}"
  count     = "${var.number}"
  image     = "${var.image}"
  cpus      = "${var.cpus}"
  memory    = "${var.memory}"

   network_adapter {
    type = "bridged"
    host_interface = "${var.host_interface}"
  }

  connection {
    type = "ssh"
    user = "vagrant"
    password = "vagrant"
    host = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh args",
    ]
  }
}
