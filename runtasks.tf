resource "tfe_organization_run_task" "hcp-packer" {
  url         = "https://api.cloud.hashicorp.com/packer/2023-01-01/terraform-cloud/validation/b4b2bfbf-d68e-4bf2-ad12-6213f924d728"
  name        = "hcp-packer"
  enabled     = true
  description = "hcp-packer runtask"
}