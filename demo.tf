locals {
  customername = "asb"
}

resource "tfe_workspace" "terraform-enterprise-azure-vcs" {
  description           = "Demo workspace for vcs driven workflow with subdirectory"
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false

  name = "${local.customername}-terraform-enterprise-azure-vcs"

  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["azure", "customerfacing",${local.customername}]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  working_directory = "ent-azure"
  vcs_repo {
    identifier         = "ausmartway/terraform-enterprise-demo"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
    trigger_prefixes ="ent-azure"
  }
}

