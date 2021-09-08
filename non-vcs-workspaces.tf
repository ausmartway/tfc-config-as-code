locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set
  inputworkspacevar = [for f in fileset(path.module, "non-vcs-workspaces/{workspace}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files
  inputworkspacemap = { for workspace in toset(local.inputworkspacevar) : workspace.name => workspace }

  # Get the data and filter it with workspace.enable_aws_credential set to true, convert it to terraform map
  inputworkspace_with_aws_map = { for workspace in toset(local.inputworkspacevar) : workspace.name => workspace 
                                      if workspace.enable_aws_credential}

  # Get the data and filter it with workspace.enable_azure_credential set to true, convert it to terraform map
  inputworkspace_with_azure_map = { for workspace in toset(local.inputworkspacevar) : workspace.name => workspace 
                                      if workspace.enable_azure_credential}
}

output "debugvar" {
 value=local.inputworkspacevar
}


output "debugmap" {
 value=local.inputworkspacemap
}


output "azure-apps" {
  value = data.tfe_workspace_ids.azure-apps.ids
}

output "aws-apps" {
  value = data.tfe_workspace_ids.aws-apps.ids
}

output "workspacenames" {
  value = keys(local.inputworkspacemap)
}

resource "tfe_workspace" "workspace" {
    for_each    = local.inputworkspacemap
    allow_destroy_plan            = true
    auto_apply                    = false
    description                   = each.value.name
    execution_mode                = "remote"
    file_triggers_enabled         = false
    global_remote_state           = false
    name                          = each.value.name
    organization                  = "yulei"
    queue_all_runs                = false
    remote_state_consumer_ids     = []
    speculative_enabled           = false
    structured_run_output_enabled = true
    tag_names                     = each.value.tags
    terraform_version             = each.value.version
    trigger_prefixes              = []
}

data "tfe_workspace_ids" "aws-apps" {
  names = keys(local.inputworkspacemap)
  tag_names    = ["aws"]
  organization = "yulei"
  depends_on = [tfe_workspace.workspace]
}

data "tfe_workspace_ids" "azure-apps" {
  names = keys(local.inputworkspacemap)
  tag_names    = ["azure"]
  organization = "yulei"
  depends_on = [tfe_workspace.workspace]
}



resource "tfe_variable" "aws_access_key_id" {
  for_each    = data.tfe_workspace_ids.aws-apps
  key          = "AWS_ACCESS_KEY_ID"
  value        = ""
  category     = "env"
  workspace_id = each.value
  description  = "AWS Access Key ID"
  lifecycle {
    ignore_changes = [value]
  }
}

# resource "tfe_variable" "aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.aws-s3-demo.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-s3-demo.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws_region" {
#   key          = "AWS_REGION"
#   value        = var.aws_default_region
#   category     = "env"
#   workspace_id = tfe_workspace.aws-s3-demo.id
#   description  = "AWS REGION"
# }