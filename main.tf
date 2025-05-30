terraform {
    required_providers {
      docker = {
        source  = "kreuzwerker/docker"
        version = "~> 2.21.0"
       }
    }
  }

 resource "docker_image" "my_nginx" {
              name = "nginx:latest"
              keep_locally = false
  }

 resource "docker_container" "my_nginx_container" {
        image = docker_image.my_nginx.name
        name = "nginx-container"
        ports {
             internal = 80
             external = 80
      }
  }
