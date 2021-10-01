locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set
  inputworkspacevar = [for f in fileset(path.module, "non-vcs-workspaces/{workspace}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files
  inputworkspacemap = { for workspace in toset(local.inputworkspacevar) : workspace.name => workspace }

}

module "non-vcs-connected-workspace" {
  source  = "ausmartway/non-vcs-connected-workspace/tfe"
  version = "0.0.1"
  for_each                      = local.inputworkspacemap
  # insert the 4 required variables here
  organization                  = var.organization
  description                   = each.value.name
  name                          = each.value.name
  terraform_version             = each.value.version
  tag_names                     = each.value.tags
  github_owner = "ausmartway"
}


//Create workspace per yaml file
# resource "tfe_workspace" "workspace" {
#   for_each                      = local.inputworkspacemap
#   allow_destroy_plan            = true
#   auto_apply                    = true
#   description                   = each.value.name
#   execution_mode                = "remote"
#   file_triggers_enabled         = false
#   global_remote_state           = false
#   name                          = each.value.name
#   organization                  = var.organization
#   queue_all_runs                = false
#   remote_state_consumer_ids     = []
#   speculative_enabled           = false
#   structured_run_output_enabled = true
#   tag_names                     = each.value.tags
#   terraform_version             = each.value.version
#   trigger_prefixes              = []
# }
