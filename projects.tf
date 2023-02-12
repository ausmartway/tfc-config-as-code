locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set
  inputprojectvar = [for f in fileset(path.module, "projects/{project}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files
  inputprojectmap = { for project in toset(local.inputprojectvar) : project.name => project }

}

resource "tfe_project" "projects" {
  for_each              = local.inputprojectmap
  name            = each.value.name
}