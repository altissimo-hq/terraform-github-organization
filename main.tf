terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.19.0"
    }
  }
}

provider "github" {
  owner = var.organization
  token = var.token
}
