terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "bober" {
  name   = "bober"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.29.1-do.0"

  node_pool {
    name       = "bober-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
