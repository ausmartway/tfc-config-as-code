resource "tfe_registry_module" "azure-hashicat" {
  organization = var.organization
  name         = "azure-hashicat"
  no_code = "true"
  vcs_repo {
    display_identifier = "ausmartway/terraform-azure-hashicat"
    identifier         = "ausmartway/terraform-azure-hashicat"
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_registry_module" "test-no-code-provisioning-registry-module" {
  organization    = var.organization
  namespace       = "terraform-aws-modules"
  module_provider = "aws"
  name            = "vpc"
  registry_name   = "public"
  no_code         = true
}