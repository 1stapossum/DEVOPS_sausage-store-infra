resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-alexander-volokhov"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu20_04
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet1.id}"
#    subnet_id = var.subnet
    nat       = true
  }

  metadata = {
    user-data = "${file("~/vm/usr.meta")}"
    "serial-port-enable" : "1"
  }
}
