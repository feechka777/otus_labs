resource "yandex_compute_disk" "boot-disk" {
#  count = var.kol
  name     = var.disk_name
  type     = var.disk_type
  zone     = var.disk_zone
  size     = var.disk_size
  image_id = var.disk_image_id
}
resource "yandex_compute_instance" "web" {
#  count = var.kol    
  name = var.web_instance_name
  resources {
    cores  = var.web_instance_cores
    memory = var.web_instance_memory
  }
  boot_disk {
    disk_id = yandex_compute_disk.boot-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = var.web_instance_nat 
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
   connection {
    type        = "ssh"
    user        = var.vm_user
    private_key = file("~/.ssh/id_ed25519")
    host        = self.network_interface[0].nat_ip_address
  }
   provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
}
provisioner "local-exec" {

    command = "ansible-playbook -u ${var.vm_user} -i '${self.network_interface[0].nat_ip_address},' --private-key ${var.ssh_key_private} provision.yml"

  }
}