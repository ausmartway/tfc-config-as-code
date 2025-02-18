##version constraints for tf and required providers
terraform {
  required_version = "1.10.4"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.62"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.4.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.0"
    }
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.35.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.102.0"
    }
  }
}
