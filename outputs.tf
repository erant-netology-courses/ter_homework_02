output "vm_instances" {
  value = "Instance name1: ${yandex_compute_instance.platform.name}; External IP1: ${yandex_compute_instance.platform.network_interface.0.nat_ip_address}; FQDN1: ${yandex_compute_instance.platform.fqdn}; Instance name2: ${yandex_compute_instance.netology-develop-platform-db.name}; External IP1: ${yandex_compute_instance.netology-develop-platform-db.network_interface.0.nat_ip_address}; FQDN1: ${yandex_compute_instance.netology-develop-platform-db.fqdn}"
  description = "task 4"
}