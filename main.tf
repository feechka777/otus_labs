terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.119.0"
    }
  }
}

provider "yandex" {
  # Configuration options
  service_account_key_file = file("~/key.json")
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}