terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }

    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.16.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "silmarillion-database" {
  name         = "postgres:latest" # TODO: switch to specific version
  keep_locally = false
}

resource "docker_container" "silmarillion-database" {
  name  = "silmarillion-database"
  image = docker_image.silmarillion-database.latest
  ports {
    internal = 5432
    external = 5432
  }
  env = ["POSTGRES_USER=dev", "POSTGRES_PASSWORD=dev", "POSTGRES_DB=internal"]

  networks_advanced {
    name = "silmarillion-network"
  }

}

## deploy the nginx proxy
resource "docker_image" "silmarillion-nginx" {
  name         = "nginx:latest" # TODO: switch to specific version
  keep_locally = false
}

resource "docker_container" "silmarillion-nginx" {
  image = docker_image.silmarillion-nginx.latest
  name  = "silmarillion-nginx"
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = "silmarillion-network"
  }
}


# deploys the silmarillion-server. Assumes that you have built a docker image locally.
resource "docker_image" "silmarillion-server" {
  name         = "air-container:latest"
  keep_locally = true
}

resource "docker_container" "silmarillion-server" {
  image    = docker_image.silmarillion-server.latest
  name     = "silmarillion-server"
  hostname = "silmarillion-server"
  ports {
    internal = 8000
    external = 8000
  }
  env = ["POSTGRES_USER=dev", "POSTGRES_PASSWORD=dev", "POSTGRES_DB=internal"]
  volumes {
    host_path      = "/home/themagicnacho/Silmarillion/"
    container_path = "/code"
    # from_container = "/code"
  }

  networks_advanced {
    name = "silmarillion-network"
  }
  depends_on = [
    docker_network.private_network,
    docker_container.silmarillion-database,
  ]
}


resource "docker_network" "private_network" {
  name = "silmarillion-network"
}


## Creates the database 
provider "postgresql" {
  host            = "localhost"
  port            = 5432
  database        = "internal"
  username        = "dev"
  password        = "dev"
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_database" "silmarillion" {
  name              = "silmarillion"
  owner             = "dev"
  connection_limit  = 100
  allow_connections = true
  depends_on = [
    docker_container.silmarillion-database
  ]
}

