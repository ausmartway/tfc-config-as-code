variable "vsc-oauth_token_id" {
  type        = string
  description = "The oauth token string from your TFC"
  default     = "ot-tkpMwbbMB59jSYiE"
  validation {
    condition     = length(var.vsc-oauth_token_id) > 4 && substr(var.vsc-oauth_token_id, 0, 3) == "ot-"
    error_message = "The vsc-oauth_token_id value must be a valid TFC/TFE VCS provider oauth token, starting with \"ot-\"."
  }
}

variable "github_personal_token" {
  type = string
  description = "The github.com personal token"
}