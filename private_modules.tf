resource "tfe_registry_module" "azure-hashicat" {
    organization = var.organization
    module_provider = "hashicorp"
    name = "azure-hashicat"
    registry_name = "private"

  vcs_repo {
    display_identifier = "ausmartway/terraform-azure-hashicat"
    identifier         = "ausmartway/terraform-azure-hashicat"
    oauth_token_id     = local.tfc_oauth_token
}
