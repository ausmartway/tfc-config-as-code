terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = ">= 0.26.1"
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

resource "tfe_workspace" "aws-s3-demo" {
  allow_destroy_plan            = true
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = true
  name                          = "aws-s3-demo"
  tag_names                     = ["customerfacing", "aws"]
  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  terraform_version             = "1.0.6"
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/aws-s3-demo"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "azure-simple-demo" {
  allow_destroy_plan            = true
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = true
  name                          = "azure-simple-demo"
  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "azure"]
  terraform_version             = "1.0.6"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/azure-basic-demo"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

resource "tfe_workspace" "multi-env-provisioning-example-0-test" {

  allow_destroy_plan            = true
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = true
  name                          = "multi-env-provisioning-example-0-test"
  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["customerfacing", "aws"]
  terraform_version             = "0.12.18"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "multi-env-provisioning-example-1-staging" {

  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "multi-env-provisioning-example-1-staging"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["customerfacing", "aws"]
  terraform_version             = "0.12.18"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "multi-env-provisioning-example-2-prod" {
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "multi-env-provisioning-example-2-prod"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["customerfacing", "aws"]
  terraform_version             = "0.12.29"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/multi-env-provisioning-example"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

resource "tfe_workspace" "terraform-aws-vault-demo" {
  allow_destroy_plan            = true
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = true
  name                          = "terraform-aws-vault-demo"
  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["internal", "aws"]
  terraform_version             = "1.0.5"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/terraform-aws-vault-demo"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

resource "tfe_workspace" "vault-config-as-code" {
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false

  name = "vault-config-as-code"

  organization                  = "yulei"
  queue_all_runs                = false
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["customerfacing", "vault", "aws"]
  terraform_version             = "1.0.5"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/vault-config-as-code"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

resource "tfe_workspace" "tfe-v5-aws-install" {
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "tfe-v5-aws-install"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["aws", "internal"]
  terraform_version             = "0.11.15"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/tfe-v5-aws-install"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

resource "tfe_workspace" "tfe-v5-aws-prepare" {
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "tfe-v5-aws-prepare"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["internal", "aws"]
  terraform_version             = "0.11.15"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/tfe-v5-aws-prepare"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "aws-shared-infra" {

  allow_destroy_plan    = true
  auto_apply            = false
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "aws-shared-infra"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["aws", "internal", ]
  terraform_version             = "0.13.6"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/terraform-aws-core"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "multicloud-dns-management" {
  allow_destroy_plan    = true
  auto_apply            = false
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "multicloud-dns-management"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["internal", "aws", "gcp", "azure"]
  terraform_version             = "0.12.29"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/dns-multicloud"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }

}

resource "tfe_workspace" "aws-lambda-example" {
  allow_destroy_plan    = true
  auto_apply            = false
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "aws-lambda-example"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["aws", "customerfacing"]
  terraform_version             = "0.11.14"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/aws-lambda-demo"
    ingress_submodules = false
    oauth_token_id     = "ot-tkpMwbbMB59jSYiE"
  }
}

