# this file contains workspaces that were imported before this tfc-config-as-code repo has been created. 
resource "tfe_workspace" "aws-lambda-example" {
  description        = "Demo workspace for deploying lambda functions."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode        = "remote"
  file_triggers_enabled = false
  # global_remote_state   = false

  name = "aws-lambda-example"

  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["aws", "customerfacing", "autoinject", "awsconsumer"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/aws-lambda-demo"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "aws-lambda-example-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.aws-lambda-example.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "multi-env-provisioning-example-0-test" {
  description        = "A demo showing how to manage multiple enviroments using one set of terraform code."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode                = "remote"
  file_triggers_enabled = false
  # global_remote_state           = false
  name                          = "multi-env-provisioning-example-0-test"
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "aws", "autoinject", "awsconsumer"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }

}

resource "tfe_variable" "multi-env-provisioning-example-0-test-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.multi-env-provisioning-example-0-test.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "multi-env-provisioning-example-1-staging" {
  description        = "A demo showing how to manage multiple enviroments using one set of terraform code."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode        = "remote"
  file_triggers_enabled = false
  # global_remote_state   = false

  name = "multi-env-provisioning-example-1-staging"

  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "aws", "autoinject", "awsconsumer"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }

}

resource "tfe_variable" "multi-env-provisioning-example-1-staging-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.multi-env-provisioning-example-1-staging.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "multi-env-provisioning-example-2-prod" {
  description        = "A demo showing how to manage multiple enviroments using one set of terraform code."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode        = "remote"
  file_triggers_enabled = false
  # global_remote_state   = false

  name = "multi-env-provisioning-example-2-prod"

  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "aws", "autoinject", "awsconsumer"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "multi-env-provisioning-example-2-prod-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.multi-env-provisioning-example-2-prod.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "terraform-aws-vault-demo" {
  description        = "A workspace that standup a demo vault instance."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode                = "remote"
  file_triggers_enabled = false
  # global_remote_state           = false
  name                          = "terraform-aws-vault-demo"
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal", "aws", "vault", "autoinject", "awsconsumer"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/terraform-aws-vault-demo"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "terraform-aws-vault-demo-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.terraform-aws-vault-demo.id
  description  = "AWS REGION"
}

# # //A local workspace managing vault on laptop
# resource "tfe_workspace" "Taipei-devopsdays" {
#   description                   = "A simple demo to show HashiCorp tools can improve security of a k8s cluster."
#   allow_destroy_plan            = true
#   auto_apply                    = true

#   //local agent
#   execution_mode                = "agent"
#   agent_pool_id                 = tfe_agent_pool.local-agent-pool.id

#   file_triggers_enabled         = false
#   global_remote_state           = false
#   name                          = "Taipei-devopsdays"
#   tag_names                     = ["customerfacing", "localagent", "vault"]
#   organization                  = var.organization
#   queue_all_runs                = false
#   speculative_enabled           = true
#   structured_run_output_enabled = true
#   terraform_version             = var.v1latest
#   trigger_prefixes              = []
#   working_directory             = "terraform-standing-up-gke"
#   vcs_repo {
#     identifier         = "ausmartway/taipei-devopsdays-2021"
#     ingress_submodules = false
#     oauth_token_id     = local.tfc_oauth_token
#   }
# }

resource "tfe_workspace" "aws-s3-demo" {
  description        = "A simple demo to show how sentinel policy as code engine can make sure s3 are provisioned securely."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode                = "remote"
  file_triggers_enabled = false
  # global_remote_state           = false
  name                          = "aws-s3-demo"
  tag_names                     = ["customerfacing", "aws", "autoinject", "awsconsumer"]
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  terraform_version             = "1.3.7"
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/aws-s3-demo"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }

}

resource "tfe_variable" "aws-s3-demo-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.aws-s3-demo.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "gcp-playground" {
  description        = "A simple demo of deploying gcp resources."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode                = "remote"
  file_triggers_enabled = false
  # global_remote_state           = false
  name                          = "gcp-playground"
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "gcp", "autoinject", "internal", "testing"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  working_directory             = "terraform-standup-gke"
  force_delete                  = true
  vcs_repo {
    identifier         = "ausmartway/gcp-playground"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "gcp-playground-gcp_region" {
  key          = "GOOGLE_REGION"
  value        = "australia-southeast1"
  category     = "env"
  workspace_id = tfe_workspace.gcp-playground.id
  description  = "GCP REGION"
}

resource "tfe_variable" "gcp-playground-gcp_credential" {
  key          = "GOOGLE_CREDENTIALS"
  value        = "REPLACE_ME"
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.gcp-playground.id
  description  = "GOOGLE_CREDENTIALS"
}

resource "tfe_variable" "gcp-playground-gcp_project" {
  key          = "GOOGLE_PROJECT"
  value        = "hc-11ee2ae13b344bb1ac2d2b21323"
  category     = "env"
  workspace_id = tfe_workspace.gcp-playground.id
  description  = "GOOGLE_PROJECT"
}

//get a list of TFC/E workspaces that has tag 'aws'
data "tfe_workspace_ids" "awsconsumer-apps" {
  tag_names    = ["awsconsumer"]
  organization = var.organization
}

data "tfe_workspace_ids" "azureconsumer-apps" {
  tag_names    = ["azureconsumer"]
  organization = var.organization
}

resource "tfe_workspace" "aws-shared-infra" {
  description = "My core aws infrustructure that are shared by other workspaces."

  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode            = "remote"
  file_triggers_enabled = false
  # global_remote_state       = false
  # remote_state_consumer_ids = values(data.tfe_workspace_ids.awsconsumer-apps.ids)
  name                          = "aws-shared-infra"
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["aws", "internal", "autoinject"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/aws-shared-infra"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }

}

resource "tfe_workspace_settings" "aws-shared-infra" {
  workspace_id              = tfe_workspace.aws-shared-infra.id
  global_remote_state       = false
  remote_state_consumer_ids = values(data.tfe_workspace_ids.awsconsumer-apps.ids)
}

resource "tfe_variable" "aws-shared-infra-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.aws-shared-infra.id
  description  = "AWS REGION"
}

resource "tfe_workspace" "azure-shared-infra" {
  description        = "Core azure infra"
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode                = "remote"
  file_triggers_enabled = false
  # global_remote_state           = true
  name                          = "azure-shared-infra"
  organization                  = var.organization
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "azure", "autoinject"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/azure-shared-infra"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace_settings" "azure-shared-infra" {
  workspace_id              = tfe_workspace.azure-shared-infra.id
  global_remote_state       = false
  remote_state_consumer_ids = values(data.tfe_workspace_ids.azureconsumer-apps.ids)
}

resource "tfe_workspace" "vault-config-as-code-aws" {
  description        = "A workspace that's used to manage my own Vault's configuration as code."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode        = "remote"
  file_triggers_enabled = false
  # global_remote_state   = false

  name = "vault-config-as-code-aws"

  organization   = var.organization
  queue_all_runs = false
  # remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "vault", "aws"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/vault-config-as-code"
    branch             = "aws"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "vault-config-as-code-local" {
  description        = "A workspace that's used to manage my own Vault's configuration as code."
  allow_destroy_plan = true
  auto_apply         = true
  # execution_mode        = "agent"
  # agent_pool_id         = tfe_agent_pool.local-agent-pool.id
  file_triggers_enabled = false
  # global_remote_state   = false

  name = "vault-config-as-code-local"

  organization   = var.organization
  queue_all_runs = false
  # remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "vault", "local"]
  terraform_version             = var.v1latest
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/vault-config-as-code"
    branch             = "local"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

# resource "tfe_workspace" "vault-config-as-code-hcp" {
#   description        = "A workspace that's used to manage my own Vault's configuration as code."
#   allow_destroy_plan = true
#   auto_apply         = true
#   force_delete = true
#   # execution_mode        = "remote"
#   file_triggers_enabled = false
#   # global_remote_state   = false

#   name = "vault-config-as-code-hcp"

#   organization   = var.organization
#   queue_all_runs = false
#   # remote_state_consumer_ids     = []
#   speculative_enabled           = true
#   structured_run_output_enabled = true
#   tag_names                     = ["customerfacing", "vault", "hcp"]
#   terraform_version             = var.v1latest
#   trigger_prefixes              = []

#   vcs_repo {
#     identifier         = "ausmartway/vault-config-as-code"
#     branch             = "hcp"
#     ingress_submodules = false
#     oauth_token_id     = local.tfc_oauth_token
#   }
# }

# resource tfe_variable enviroment {
#   key          = "enviroment"
#   value        = "hcp-public"
#   category     = "env"
#   description  = "the enviroment that this workspace is in."
#   workspace_id = tfe_workspace.vault-config-as-code-hcp.id
# }
