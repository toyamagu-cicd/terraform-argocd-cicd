variable "github_oidc_repos" {
  description = "GitHub OIDC repositories"
  type = list(object({
    owner      = string
    repository = string
    })
  )
}

variable "iam_policy" {
  description = "AWS IAM Policy"
  type = list(object({
    name = string
    json = string
  }))
}

variable "oidc_provider_arns" {
  description = "OIDC provider arns"
  type        = list(string)
}
