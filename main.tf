terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.70.0"
    }
  }
}

resource "yandex_vpc_network" "net1" {
  name = "alexander-volokhov-net"
}

resource "yandex_vpc_subnet" "subnet1" {
  v4_cidr_blocks = ["10.128.0.0/24"]
  zone           = var.ZONA
  network_id     = "${yandex_vpc_network.net1.id}"
#  network_id     = "enpv2krbk8skcahr9q5q"
}

## As you say in paragraph 2 of review, i follow this.
## Its often situation if i create my own network i can't see (ping) my vm created by terraform. Ip of my main vm is 10.128.0.21. Onse ip of my terraformVM was 10.128.0.20. And no ping!
## Whis way creating new net. But my main VM in another (dafault) network.
## And i dont know (yet) hot to use existing (default) network by this way.
