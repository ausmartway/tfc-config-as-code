resource "tfe_registry_module" "azure-hashicat" {
  organization = var.organization
  name         = "hashicat"
  no_code      = true
  vcs_repo {
    display_identifier = "ausmartway/terraform-azure-hashicat"
    identifier         = "ausmartway/terraform-azure-hashicat"
    oauth_token_id     = local.tfc_oauth_token
  }
}

