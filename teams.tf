locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set
  inputteamvar = [for f in fileset(path.module, "teams/{team}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files
  inputteammap = { for team in toset(local.inputteamvar) : team.name => team }

}

resource "tfe_team" "teams" {
  for_each     = local.inputteammap
  name         = each.value.name
  organization = "yulei"
}





# resource "tfe_team_access" "team-access" {
#   for_each = local.inputteammap
#   access       = "owner"
#   team_id      = tfe_team.teams[each.value.name].id
#   workspace_id = tfe_workspace.test.id
# }