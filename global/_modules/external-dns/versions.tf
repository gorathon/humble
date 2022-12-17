terraform {
  required_version = "~> 1.3.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.30.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.16.0"
    }

    http = {
      source = "hashicorp/http"
      version = "~> 3.2.0"
    }
  }
}
