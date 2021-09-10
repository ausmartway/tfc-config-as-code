# resource "tfe_variable" "aws-s3-demo-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-s3-demo.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws-s3-demo-aws_secret_access_key" {
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

# resource "tfe_variable" "aws-s3-demo-aws_session_token" {
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


# resource "tfe_variable" "multi-env-provisioning-example-0-test-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-0-test.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multi-env-provisioning-example-0-test-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-0-test.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "multi-env-provisioning-example-0-test-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-0-test.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "multi-env-provisioning-example-1-staging-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-1-staging.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multi-env-provisioning-example-1-staging-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-1-staging.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multi-env-provisioning-example-1-staging-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-1-staging.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }



# resource "tfe_variable" "multi-env-provisioning-example-2-prod-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-2-prod.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multi-env-provisioning-example-2-prod-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-2-prod.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multi-env-provisioning-example-2-prod-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multi-env-provisioning-example-2-prod.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "terraform-aws-vault-demo-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.terraform-aws-vault-demo.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "terraform-aws-vault-demo-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.terraform-aws-vault-demo.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "terraform-aws-vault-demo-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.terraform-aws-vault-demo.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "tfe-v5-aws-install-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-install.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "tfe-v5-aws-install-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-install.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "tfe-v5-aws-install-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-install.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }



# resource "tfe_variable" "tfe-v5-aws-prepare-aws_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-prepare.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "tfe-v5-aws-prepare-aws_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-prepare.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "tfe-v5-aws-prepare-aws_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.tfe-v5-aws-prepare.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "aws-shared-infra_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-shared-infra.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws-shared-infra_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.aws-shared-infra.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws-shared-infra_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-shared-infra.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "multicloud-dns-management_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multicloud-dns-management.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multicloud-dns-management_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.multicloud-dns-management.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "multicloud-dns-management_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.multicloud-dns-management.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }


# resource "tfe_variable" "aws-lambda-example_access_key_id" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-lambda-example.id
#   description  = "AWS Access Key ID"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws-lambda-example_secret_access_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "my_value_name"
#   sensitive    = true
#   category     = "env"
#   workspace_id = tfe_workspace.aws-lambda-example.id
#   description  = "AWS Secret Access Key"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }

# resource "tfe_variable" "aws-lambda-example_session_token" {
#   key          = "AWS_SESSION_TOKEN"
#   sensitive    = true
#   value        = "my_value_name"
#   category     = "env"
#   workspace_id = tfe_workspace.aws-lambda-example.id
#   description  = "AWS Session Token"
#   lifecycle {
#     ignore_changes = [value]
#   }
# }
