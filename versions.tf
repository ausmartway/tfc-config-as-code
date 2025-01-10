##version constraints for tf and required providers
terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = {
      # source = "ausmartway/tfe"
      version = ">=0.61"
    }
    vault = ">= 4.4.0"
    github = {
      source  = "integrations/github"
      version = ">= 6.0"
    }
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 0.35.0"
    }
  }
}
