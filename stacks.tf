# terraform stacks is a new feature introduced

resource "tfe_stack" "test-stack" {
  name         = "my-stack"
  description  = "A Terraform Stack using two components with two environments"
  project_id   = tfe_project.projects["Playground"].id

  vcs_repo {
    branch         = "main"
    identifier     = "ausmartway/stack-repo"
    oauth_token_id = local.tfc_oauth_token
  }
}

# resource github_repository "stack-repo" {
#   name = "stack-repo"
#   description = "A repository for the stack"
#   visibility = "private"
# }