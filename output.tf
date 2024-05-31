output "internal_ip_address_for_web" {
  value = yandex_compute_instance.web.network_interface.0.ip_address
}

output "external_ip_address_var_for_web" {
  value = yandex_compute_instance.web.network_interface.0.nat_ip_address
}
