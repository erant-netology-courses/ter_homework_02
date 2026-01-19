###1vm vars

variable "vm_web_yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image name"
}

variable "vm_web_yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Instance name"
}

variable "vm_web_yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
}

# variable "vm_web_yandex_compute_instance_cores" {
#   type        = number
#   default     = 2
# }
# variable "vm_web_yandex_compute_instance_cores_fraction" {
#   type        = number
#   default     = 5
# }
# variable "vm_web_yandex_compute_instance_memory" {
#   type        = number
#   default     = 1
# }

###2nd vm vars

variable "vm_db_yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image name"
}

variable "vm_db_yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Instance name"
}

variable "vm_db_yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
}

# variable "vm_db_yandex_compute_instance_cores" {
#   type        = number
#   default     = 2
# }
# variable "vm_db_yandex_compute_instance_cores_fraction" {
#   type        = number
#   default     = 20
# }
# variable "vm_db_yandex_compute_instance_memory" {
#   type        = number
#   default     = 2
# }

variable "vm_db_yandex_compute_instance_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "vm_db"
  description = "VPC network & subnet name for db"
}

variable "vms_resources" {
  type = map(any)

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

locals {
  vms_metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}