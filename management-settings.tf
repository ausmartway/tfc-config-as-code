##test123
terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe   = ">= 0.40.0"
    vault = "= 3.11.0"
    github = {
      source  = "integrations/github"
      version = "= 4.31.0"
    }
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.35.0"
    }
  }
}

locals {
  ##this can be changed to switch between A/B github connection.
  tfc_oauth_token = tfe_oauth_client.github-b.oauth_token_id
}

provider "tfe" {
  token = var.tfe_token
}

provider "vault" {

}

provider "github" {
  token = var.github_personal_token
}

//create an agent pool that has to be run locally
resource "tfe_agent_pool" "local-agent-pool" {
  name         = "local-agent-pool"
  organization = var.organization
}

resource "tfe_agent_token" "local-agent-pool-token" {
  agent_pool_id = tfe_agent_pool.local-agent-pool.id
  description   = "docker-agent-token"
}
resource "tfe_agent_pool" "agent-pools" {
  for_each     = local.inputteammap
  name         = "agent-pool-for-${each.value.name}"
  organization = "yulei"
}

resource "tfe_agent_token" "agent-tokens" {
  for_each      = local.inputteammap
  agent_pool_id = tfe_agent_pool.agent-pools[each.value.name].id
  description   = "agent-token-for-${each.value.name}"
}

resource "tfe_workspace" "tfc-config-as-code" {
  description           = "Workspace for managing my own TFC orgnisation's configuration as code, using terraform."
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = true
  global_remote_state   = false
  project_id = tfe_project.projects["management"]
  name = "tfc-config-as-code"

  organization                  = var.organization
  queue_all_runs                = false
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["tfc", "internal", "management"]
  terraform_version             = var.tf_latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/tfc-config-as-code"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_oauth_client" "github-a" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_personal_token
  service_provider = "github"
}

resource "tfe_oauth_client" "github-b" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_personal_token
  service_provider = "github"
}

resource "tfe_oauth_client" "gitlab-a" {
  organization     = var.organization
  api_url          = "https://gitlab.com/api/v4"
  http_url         = "https://gitlab.com"
  oauth_token      = var.gitlab_personal_token
  service_provider = "gitlab_hosted"
}

resource "tfe_oauth_client" "gitlab-b" {
  organization     = var.organization
  api_url          = "https://gitlab.com/api/v4"
  http_url         = "https://gitlab.com"
  oauth_token      = var.gitlab_personal_token
  service_provider = "gitlab_hosted"
}

resource "tfe_workspace" "tfc-credential-injector" {
  allow_destroy_plan    = true
  auto_apply            = true
  description           = "A workspace that will inject aws and azure credentials to other workspaces automaticly."
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false
  project_id = tfe_project.projects["management"]
  name                          = "tfc-credential-injector"
  organization                  = var.organization
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal", "tfc", "management"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/tfc-credential-injector"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "tfc-notification-configurator" {
  allow_destroy_plan    = true
  auto_apply            = true
  description           = "A workspace that will configure TFC/E notifications based on tag automaticly."
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false
  project_id = tfe_project.projects["management"]
  name                          = "tfc-notification-configurator"
  organization                  = var.organization
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal", "tfc", "management"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/tfc-notification-configurator"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "tfc-policyset-attacher" {
  allow_destroy_plan            = true
  auto_apply                    = true
  description                   = "A workspace that will configure TFC/E notifications based on tag automaticly."
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = false
  project_id = tfe_project.projects["management"]
  name                          = "tfc-policyset-attacher"
  organization                  = var.organization
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal", "tfc", "management"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/tfc-policyset-attacher"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "tfc-policyset-attacher-orgnization" {
  key          = "organization"
  value        = var.organization
  category     = "terraform"
  workspace_id = tfe_workspace.tfc-policyset-attacher.id
  description  = "TFC/E organization"
}

resource "tfe_variable" "tfc-policyset-attacher-tfc_oauth_token_id" {
  key          = "tfc_oauth_token_id"
  value        = local.tfc_oauth_token
  category     = "terraform"
  workspace_id = tfe_workspace.tfc-policyset-attacher.id
  description  = "VCS connection oauth token id"
}

## triggers credential-injector, notification-configurator and policy-attacher after successful apply of config-as-code
## Those three should only be triggered after config-as-code so that they can get full list of workspaces that have certain tags.
resource "tfe_run_trigger" "auto_trigger_tfc-credential-injector" {
  workspace_id  = tfe_workspace.tfc-credential-injector.id
  sourceable_id = tfe_workspace.tfc-config-as-code.id
}

resource "tfe_run_trigger" "auto_trigger_tfc-notification-configurator" {
  workspace_id  = tfe_workspace.tfc-notification-configurator.id
  sourceable_id = tfe_workspace.tfc-config-as-code.id
}

resource "tfe_run_trigger" "auto_trigger_tfc-policy-attacher" {
  workspace_id  = tfe_workspace.tfc-policyset-attacher.id
  sourceable_id = tfe_workspace.tfc-config-as-code.id
}

resource "tfe_variable_set" "azure" {
  name         = "Global Varset for Azure"
  description  = "Variable set applied to all workspaces with tag azure and autoinjection."
  global       = false
  organization = var.organization
}

data "vault_generic_secret" "azure" {
  path = "kv/azure"
}

## Add Azure credentials ENV variables 
resource "tfe_variable" "azure_subscription_id" {
  key             = "ARM_SUBSCRIPTION_ID"
  value           = data.vault_generic_secret.azure.data["ARM_SUBSCRIPTION_ID"]
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
  description     = "Azure Subscription Id"

}

resource "tfe_variable" "azure_tenant_id" {
  key             = "ARM_TENANT_ID"
  value           = data.vault_generic_secret.azure.data["ARM_TENANT_ID"]
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
  description     = "Azure Tenant Id"
}

resource "tfe_variable" "azure_client_id" {
  key             = "ARM_CLIENT_ID"
  value           = data.vault_generic_secret.azure.data["ARM_CLIENT_ID"]
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
  description     = "Azure Client Id"
}

resource "tfe_variable" "azure_client_secret" {
  key             = "ARM_CLIENT_SECRET"
  value           = data.vault_generic_secret.azure.data["ARM_CLIENT_SECRET"]
  category        = "env"
  variable_set_id = tfe_variable_set.azure.id
  sensitive       = true
  description     = "Azure Client Secret"
}

resource "tfe_organization_run_task" "snyk" {
  organization = var.organization
  url          = "https://api.snyk.io/v1/terraform-cloud/2df223b0-f339-4303-99ce-955159121971"
  hmac_key     = var.snyk_hmac_key
  name         = "snyk"
  enabled      = true
}

resource "tfe_organization_run_task" "infracost" {
  organization = var.organization
  url          = "https://dashboard.api.infracost.io/hooks/9fef9204-96e8-466b-8e84-731a04552ec3"
  hmac_key     = var.infracost_hmac_key
  name         = "infracost"
  enabled      = true
}

data "tfe_workspace_ids" "customerfacing" {
  tag_names    = ["customerfacing"]
  organization = var.organization
}

resource "tfe_workspace_run_task" "snyk" {
  for_each          = data.tfe_workspace_ids.customerfacing.ids
  workspace_id      = each.value
  task_id           = resource.tfe_organization_run_task.snyk.id
  enforcement_level = "advisory"
}

resource "tfe_workspace_run_task" "infracost" {
  for_each          = data.tfe_workspace_ids.customerfacing.ids
  workspace_id      = each.value
  task_id           = resource.tfe_organization_run_task.infracost.id
  enforcement_level = "advisory"
}