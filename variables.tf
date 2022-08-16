variable "tf_latest" {
  type        = string
  description = "The latest version of terraform cli."
  validation {
    condition     = substr(var.tf_latest, 0, 2) == "1."
    error_message = "The terraform cli version must match 1.*."
  }
  default = "1.2.6"
}


variable "v1latest" {
  type        = string
  description = "The version of terraform cli for all workspace that is v1"
  validation {
    condition     = substr(var.v1latest, 0, 2) == "1."
    error_message = "The terraform cli version must match 1.*."
  }
  default = "1.1.9"
}
variable "v015latest" {
  type        = string
  description = "The version of terraform cli for all workspace that is v0.15"
  validation {
    condition     = substr(var.v015latest, 0, 4) == "0.15"
    error_message = "The terraform cli version must match 0.15.*."
  }
  default = "0.15.5"
}


variable "github_personal_token" {
  type        = string
  description = "The github.com personal token"
  validation {
    condition     = length(var.github_personal_token) > 4 && substr(var.github_personal_token, 0, 4) == "ghp_"
    error_message = "The github_personal_token value must be a valid github personal token, starting with \"ghp_\"."
  }
}

variable "gitlab_personal_token" {
  type        = string
  description = "The gitlab.com personal token"
  validation {
    condition     = length(var.gitlab_personal_token) > 19
    error_message = "The gitlab_personal_token value must be a valid https://gitlab.com personal token, longer than 20 characters."
  }
}

variable "snyk_hmac_key" {
  type        = string
  description = "HMAC key for Sync.io integration."
}

variable "infracost_hmac_key" {
  type        = string
  description = "HMAC key for infracost.io integration."
}



variable "organization" {
  type        = string
  description = "Name of TFC/E organization"
}

variable "tfe_token" {
  type = string
  validation {
    condition     = length(var.tfe_token) >= 90 && can(regex("[[:alnum:]]+.atlasv1.[[:alnum:]]+", var.tfe_token))
    error_message = "The tfe_token value must be a valid TFC/E personal token, containing substring \".atlasv1.\" in the middle."
  }
  description = "TFC/E token that has permission to manage workspace/policy-set/variable/notification/tags, note that orgnization/team token are not enough."
}

variable "aws_default_region" {
  type        = string
  description = "the default AWS_REGION"
  default     = "ap-southeast-2"
  validation {
    condition     = length(var.aws_default_region) > 8 && can(regex("[[:alpha:]]+-[[:alpha:]]+-[0-9]", var.aws_default_region))
    error_message = "The variable aws_default_region must be longer than 8 chars and meet the format of [[:alpha:]]+-[[:alpha:]]+-[0-9]."
  }
}