terraform {
  required_providers {
    docker = {
      source  = "terraform-providers/docker"
      version = "~> 2.7.2"
    }
  }
}

provider "docker" {}

variable "external_port" {
    type = number
    default = 1880
}

variable "internal_port" {
    type = number
    default = 1880
}

variable "container_count" {
    type = number
    default = 2
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count = var.container_count
  length = 5
  special = false
  upper = false
}

 resource "docker_container" "node_container" {
   count = var.container_count
   name  = join("-", ["nodered", random_string.random[count.index].result])
   image = docker_image.nodered_image.latest
   ports {
     internal = var.internal_port
     external = var.external_port + count.index
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

