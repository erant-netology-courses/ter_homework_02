# ter_homework_02

## Задание 1
4 - неверный путь к авторизационному ключу сервисного аккаунта. неверные параметры машины

6 - денег сэкономят

<img width="1280" height="360" alt="image" src="https://github.com/erant-netology-courses/ter_homework_02/1.JPG" />

<img width="1280" height="360" alt="image" src="https://github.com/erant-netology-courses/ter_homework_02/1_console.JPG" />

## Задание 4
terraform output
`vm_instances = "Instance name1: netology-develop-platform-web; External IP1: 178.154.228.231; FQDN1: fhm39em03rtpb2umcc37.auto.internal; Instance name2: netology-develop-platform-db; External IP1: 158.160.72.41; FQDN1: epdcr5k24gel40op5hnk.auto.internal"`

> Перед 5 заданием сделал terraform destroy из за нейминга, проверял кое что. Исправил нейминг и воссоздал ресурсы

## Задание 7*
1. local.test_list[1]
2. 3
3. local.test_map.admin
4. "${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} v${keys(local.servers.production)[0]}, ${local.servers.production.ram} ${keys(local.servers.production)[3]} and ${length(local.servers.production.disks)} virtual ${keys(local.servers.production)[1]}" -> "John is admin for production server based on OS ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks"

## Задание 8*
var.test[0].dev1[0]

## Задание 9*
<img width="1280" height="360" alt="image" src="https://github.com/erant-netology-courses/ter_homework_02/9.JPG" />