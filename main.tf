terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.21.1"
    }
  }
}

provider "github" {
  owner = var.organization
  token = var.token
}
