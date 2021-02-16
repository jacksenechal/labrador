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

resource "random_string" "random" {
  count = 4
  length = 5
  special = false
  upper = false
}

 resource "docker_container" "node_container" {
   count = 2
   name  = join("-", ["nodered", random_string.random[count.index].result])
   image = docker_image.nodered_image.latest
   ports {
     internal = 1880
   }
 }

output "ip-address" {
  value       =  [ for i in docker_container.node_container[*]: join(":", [i.ip_address], i.ports[*]["external"]) ]
  description = "The IP address and external port of the container"
}

output "container-name" {
  value       = docker_container.node_container[*].name
  description = "The name of the container"
}
