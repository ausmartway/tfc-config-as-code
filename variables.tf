
variable "github_personal_token" {
  type = string
  description = "The github.com personal token"
   validation {
    condition     = length(var.github_personal_token) > 4 && substr(var.github_personal_token, 0, 4) == "ghp_"
    error_message = "The github_personal_token value must be a valid github personal token, starting with \"ghp_\"."
  }
}