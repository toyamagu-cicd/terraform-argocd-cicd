<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~>5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.36.1 |
| <a name="provider_github"></a> [github](#provider\_github) | 5.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_github_oidc"></a> [aws\_github\_oidc](#module\_aws\_github\_oidc) | ../../modules/aws-github-oidc | n/a |
| <a name="module_aws_github_oidc_iam_role"></a> [aws\_github\_oidc\_iam\_role](#module\_aws\_github\_oidc\_iam\_role) | ../../modules/aws-github-oidc-iam-role/ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.cicd-sample](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [github_actions_organization_secret.file](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret) | resource |
| [github_actions_secret.var](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_app_installation_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) | resource |
| [github_branch.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_protection_v3.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_team.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [aws_iam_policy_document.github_actions_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_protections"></a> [branch\_protections](#input\_branch\_protections) | branch protections | <pre>list(object({<br>    repository                    = string<br>    branch                        = string<br>    enforce_admins                = bool<br>    required_pull_request_reviews = optional(map(any), null)<br>    restrictions                  = optional(map(any), null)<br>  }))</pre> | `[]` | no |
| <a name="input_create_oidc_provider_github"></a> [create\_oidc\_provider\_github](#input\_create\_oidc\_provider\_github) | Flag to create OIDC provider for GitHub | `bool` | `false` | no |
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | ECR repository name | `string` | n/a | yes |
| <a name="input_github_app_installations"></a> [github\_app\_installations](#input\_github\_app\_installations) | Install Github Application to a repository | <pre>list(object({<br>    repository      = string<br>    installation_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_github_oidc_repos"></a> [github\_oidc\_repos](#input\_github\_oidc\_repos) | GitHub OIDC repositories | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | GitHub org name | `string` | n/a | yes |
| <a name="input_organization_secret_from_file"></a> [organization\_secret\_from\_file](#input\_organization\_secret\_from\_file) | GitHub organization secrets (file) | <pre>list(object({<br>    secret_name     = string<br>    visibility      = string<br>    secret_filename = string<br>    repositories    = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | GitHub Repositories | <pre>list(object({<br>    name        = string<br>    description = string<br>    create      = optional(bool, true)<br>    visibility  = optional(string, "private")<br>    auto_init   = optional(bool, true)<br>    branches    = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_repository_secrets"></a> [repository\_secrets](#input\_repository\_secrets) | Repository Secrets | <pre>list(object({<br>    repository  = string<br>    secret_name = string<br>    value       = string<br>  }))</pre> | `[]` | no |
| <a name="input_team_repository_permissions"></a> [team\_repository\_permissions](#input\_team\_repository\_permissions) | Repository permissions for team | <pre>list(object({<br>    repository = string<br>    team       = string<br>    permission = string<br>  }))</pre> | `[]` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | GitHub Org teams | <pre>list(object({<br>    name        = string<br>    description = string<br>    privacy     = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->