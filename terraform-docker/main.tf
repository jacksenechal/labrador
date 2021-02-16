terraform {
  required_providers {
    docker = {
      source  = "terraform-providers/docker"
      version = "~> 2.7.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "node_container" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "IP-Address" {
  value       = join(":", [docker_container.node_container.ip_address, docker_container.node_container.ports[0].external])
  description = "The IP address and external port of the container"
}

output "container-name" {
  value       = docker_container.node_container.name
  description = "The name of the container"
}
