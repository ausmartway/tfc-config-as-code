terraform {
    backend "remote" {
    hostname = "app.terraform.io"
    organization = "yulei"

    workspaces {
      name = "tfc-config-as-code"
    }
}
}
