resource "yandex_vpc_network" "net" {
  name = var.net_var
}

resource "yandex_vpc_subnet" "subnet" {
  name           = var.sb_name
  zone           = var.sb_zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = var.sb_v4_cidr_blocks
}

