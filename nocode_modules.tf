locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set
  inputnocodevar = [for f in fileset(path.module, "no-code-modules/{nocode}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files
  inputnocodemap = { for nocode in toset(local.inputnocodevar) : nocode.name => nocode }

}

resource "tfe_registry_module" "test-no-code-provisioning-registry-module" {
  for_each              = local.inputnocodemap
  organization    = var.organization
  namespace       = "terraform-aws-modules"
  module_provider = each.value.module_provider
  name            = each.value.name
  registry_name   = each.value.registry_name
  no_code         = true
}