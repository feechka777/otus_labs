variable "kol" {
   type = number
   default = 1
   description = "количество ресурсов для count ПОКА НЕ РАБОТАЕТ"
}
variable "ssh_key_private" {
  type        = string
}
variable "vm_user" {
  type        = string
}
variable "ssh_pub_key" {
  type        = string
}
variable "ssh_key_public" {
  type        = string
}
variable "yc_cloud_id" {
  type        = string
}
variable "yc_folder_id" {
  type        = string
}
variable "zone" {
   type = string
   default = "ru-central1-a"
}
####### ЗАДАЕМ СЕТИ ########
variable "net_var" {
   type = string
   default = "network-labs"
   description = "Задаем название сети"
}
### Настройки подсети:
variable "sb_name" {
   type = string
   default = "Prod subnet"
}
variable "sb_zone" {
   type = string
   default = "ru-central1-a"
}
variable "sb_v4_cidr_blocks" {
   type = list(string)
   default = ["192.168.10.0/24"]
} 
####### ЗАДАЕМ ПАРАМЕТРЫ ЗАГРУЗОЧНОГО ДИСКА ДЛЯ ВМ ########
variable "disk_image_id" {
   type = string
   default = "fd80bm0rh4rkepi5ksdi" #ubuntu 22/04
}
variable "disk_type" {
   type = string
   default = "network-hdd"
}
variable "disk_name" {
   type = string
   default = "disk"
}
variable "disk_zone" {
   type = string
   default = "ru-central1-a"
}
variable "disk_size" {
   type = number
   default = 30
}
####### ЗАДАЕМ ПАРАМЕТРЫ Виртуалки ########
variable "web_instance_name" {
   type = string
   default = "web-server"
}
variable "web_instance_nat" {
   type = bool
   default = true
}
variable "web_instance_cores" {
    type = number
    default = 2
}
variable "web_instance_memory" {
    type = number
    default = 4
}