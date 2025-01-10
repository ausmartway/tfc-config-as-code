resource "tfe_stack" "test-stack" {
  name         = "my-stack"
  description  = "A Terraform Stack using two components with two environments"
  project_id   = tfe_project.projects["Development"].id

  vcs_repo {
    branch         = "main"
    identifier     = "ausmartway/stack-repo"
    oauth_token_id = tfe_oauth_client.test.oauth_token_id
  }
}

resource github_repository "stack-repo" {
  name = "stack-repo"
  description = "A repository for the stack"
  visibility = "private"
}