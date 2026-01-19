resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_yandex_compute_image
}
resource "yandex_compute_instance" "platform" {
  name        = local.platform_name
  platform_id = var.vm_web_yandex_compute_instance_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    # nat       = true
  }

  metadata = local.vms_metadata
}


resource "yandex_vpc_subnet" "db_subnet" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_yandex_compute_instance_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}
resource "yandex_compute_instance" "netology-develop-platform-db" {
  name        = local.db_name
  platform_id = var.vm_db_yandex_compute_instance_platform_id
  zone        = var.vm_db_yandex_compute_instance_zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db_subnet.id
    # nat       = true
  }

  metadata = local.vms_metadata
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = "b1gk2qqtnghqup9askeq"
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = "b1gk2qqtnghqup9askeq"
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
