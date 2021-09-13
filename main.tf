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

locals {
  tfc_oauth_token = tfe_oauth_client.github-a.oauth_token_id
}

resource "tfe_workspace" "aws-s3-demo" {
  description                   = "A simple demo to show how sentinel policy as code engine can make sure s3 are provisioned securely."
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

resource "tfe_workspace" "azure-simple-demo" {
  description                   = "A simple demo of deploying Azure resources."
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
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "multi-env-provisioning-example-0-test" {
  description                   = "A demo showing how to manage multiple enviroments using one set of terraform code."
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
  terraform_version             = "1.0.6"
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
  description           = "A demo showing how to manage multiple enviroments using one set of terraform code."
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
  terraform_version             = "1.0.6"
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
  description           = "A demo showing how to manage multiple enviroments using one set of terraform code."
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
  terraform_version             = "1.0.6"
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
  description                   = "A workspace that standup a demo vault instance."
  allow_destroy_plan            = true
  auto_apply                    = true
  execution_mode                = "remote"
  file_triggers_enabled         = false
  global_remote_state           = true
  name                          = "terraform-aws-vault-demo"
  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal", "aws","vault"]
  terraform_version             = "1.0.6"
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


resource "tfe_workspace" "vault-config-as-code" {
  description           = "A workspace that's used to manage my own Vault's configuration as code."
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
  terraform_version             = "1.0.6"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/vault-config-as-code"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "tfe-v5-aws-install" {
  description           = "Install a tfe v5 instance."
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
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_variable" "tfe-v5-aws-install-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.tfe-v5-aws-install.id
  description  = "AWS REGION"
}


resource "tfe_workspace" "tfe-v5-aws-prepare" {
  description           = "Setup resources for a TFE v5 installation."
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
    oauth_token_id     = local.tfc_oauth_token
  }

}

resource "tfe_variable" "tfe-v5-aws-prepare-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.tfe-v5-aws-prepare.id
  description  = "AWS REGION"
}



resource "tfe_workspace" "aws-shared-infra" {
  description = "My core aws infrustructure that are shared by other workspaces."

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
  terraform_version             = "1.0.6"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/terraform-aws-core"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }

}


resource "tfe_variable" "aws-shared-infra-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.aws-shared-infra.id
  description  = "AWS REGION"
}


resource "tfe_workspace" "multicloud-dns-management" {
  description           = "Manages my aws/azure/gcp DNS records using aws route53."
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
  terraform_version             = "0.12.31"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/dns-multicloud"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}


resource "tfe_variable" "multicloud-dns-management-aws_region" {
  key          = "AWS_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.multicloud-dns-management.id
  description  = "AWS REGION"
}


resource "tfe_workspace" "aws-lambda-example" {
  description           = "Demo workspace for deploying lambda functions."
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = true

  name = "aws-lambda-example"

  organization                  = "yulei"
  queue_all_runs                = false
  speculative_enabled           = true
  structured_run_output_enabled = false
  tag_names                     = ["aws", "customerfacing"]
  terraform_version             = "1.0.6"
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


resource "tfe_workspace" "tfc-config-as-code" {
  description           = "Workspace for managing my own TFC orgnisation's configuration as code, using terraform."
  allow_destroy_plan    = true
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = true
  global_remote_state   = false

  name = "tfc-config-as-code"

  organization                  = "yulei"
  queue_all_runs                = false
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["tfc", "internal"]
  terraform_version             = "1.0.6"
  trigger_prefixes              = []

  vcs_repo {
    identifier         = "ausmartway/tfc-config-as-code"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_oauth_client" "github-a" {
  organization     = "yulei"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_personal_token
  service_provider = "github"
}

resource "tfe_oauth_client" "github-b" {
  organization     = "yulei"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_personal_token
  service_provider = "github"
}

resource "tfe_workspace" "tfc-credential-injector" {
  allow_destroy_plan    = true
  auto_apply            = true
  description           = "A workspace that will inject aws and azure credentials to other workspaces automaticly."
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false

  name = "tfc-credential-injector"
  organization                  = "yulei"
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal","tfc"]
  terraform_version             = "1.0.6"
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

  name = "tfc-notification-configurator"
  organization                  = "yulei"
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal","tfc"]
  terraform_version             = "1.0.6"
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/tfc-notification-configurator"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}

resource "tfe_workspace" "tfc-policyset-attacher" {
  allow_destroy_plan    = true
  auto_apply            = true
  description           = "A workspace that will configure TFC/E notifications based on tag automaticly."
  execution_mode        = "remote"
  file_triggers_enabled = false
  global_remote_state   = false

  name = "tfc-policyset-attacher"
  organization                  = "yulei"
  queue_all_runs                = true
  remote_state_consumer_ids     = []
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = ["internal","tfc"]
  terraform_version             = "1.0.6"
  trigger_prefixes              = []
  vcs_repo {
    identifier         = "ausmartway/tfc-policyset-attacher"
    ingress_submodules = false
    oauth_token_id     = local.tfc_oauth_token
  }
}


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