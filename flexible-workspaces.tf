# resource "tfe_workspace" "tfe-v5-aws-install" {
#   description           = "Install a tfe v5 instance."
#   allow_destroy_plan    = true
#   auto_apply            = true
#   execution_mode        = "remote"
#   file_triggers_enabled = false
#   global_remote_state   = false

#   name = "tfe-v5-aws-install"

#   organization                  = var.organization
#   queue_all_runs                = false
#   speculative_enabled           = true
#   structured_run_output_enabled = true
#   tag_names                     = ["aws", "internal"]
#   terraform_version             = "0.11.15"
#   trigger_prefixes              = []

#   vcs_repo {
#     identifier         = "ausmartway/tfe-v5-aws-install"
#     ingress_submodules = false
#     oauth_token_id     = local.tfc_oauth_token
#   }
# }

# resource "tfe_variable" "tfe-v5-aws-install-aws_region" {
#   key          = "AWS_REGION"
#   value        = var.aws_default_region
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-install.id
#   description  = "AWS REGION"
# }


# resource "tfe_workspace" "tfe-v5-aws-prepare" {
#   description           = "Setup resources for a TFE v5 installation."
#   allow_destroy_plan    = true
#   auto_apply            = true
#   execution_mode        = "remote"
#   file_triggers_enabled = false
#   global_remote_state   = false

#   name = "tfe-v5-aws-prepare"

#   organization                  = var.organization
#   queue_all_runs                = false
#   speculative_enabled           = true
#   structured_run_output_enabled = true
#   tag_names                     = ["internal", "aws"]
#   terraform_version             = "0.11.15"
#   trigger_prefixes              = []

#   vcs_repo {
#     identifier         = "ausmartway/tfe-v5-aws-prepare"
#     ingress_submodules = false
#     oauth_token_id     = local.tfc_oauth_token
#   }

# }

# resource "tfe_variable" "tfe-v5-aws-prepare-aws_region" {
#   key          = "AWS_REGION"
#   value        = var.aws_default_region
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-prepare.id
#   description  = "AWS REGION"
# }

