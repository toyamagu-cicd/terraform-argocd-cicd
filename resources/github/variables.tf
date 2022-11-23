variable "github_owner" {
  description = "GitHub org name"
  type        = string
}
variable "repositories" {
  description = "GitHub Repositories"
  type = list(object({
    name        = string
    description = string
    create      = optional(bool, true)
    visibility  = optional(string, "private")
    auto_init   = optional(bool, true)
    branches    = optional(list(string), [])
  }))
  default = []
}

variable "teams" {
  description = "GitHub Org teams"
  type = list(object({
    name        = string
    description = string
    privacy     = string
  }))
  default = []
}


variable "branch_protections" {
  description = "branch protections"
  type = list(object({
    repository                    = string
    branch                        = string
    enforce_admins                = bool
    required_pull_request_reviews = optional(map(any), null)
    restrictions                  = optional(map(any), null)
  }))
  default = []
}

variable "team_repository_permissions" {
  description = "Repository permissions for team"
  type = list(object({
    repository = string
    team       = string
    permission = string
  }))
  default = []
}

variable "github_app_installations" {
  description = "Install Github Application to a repository"
  type = list(object({
    repository      = string
    installation_id = string
  }))
  default = []
}

variable "repository_secrets" {
  description = "Repository Secrets"
  type = list(object({
    repository  = string
    secret_name = string
    value       = string
  }))
  default = []
}

variable "organization_secret_from_file" {
  description = "GitHub organization secrets (file)"
  type = list(object({
    secret_name     = string
    visibility      = string
    secret_filename = string
    repositories    = list(string)
  }))
  default = []
}

variable "github_oidc_repos" {
  description = "GitHub OIDC repositories"
  type        = list(string)
  default     = [""]
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "create_oidc_provider_github" {
  description = "Flag to create OIDC provider for GitHub"
  type        = bool
  default     = false
}
