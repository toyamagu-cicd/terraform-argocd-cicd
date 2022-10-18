<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.example_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_app_installation_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) | resource |
| [github_branch.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_protection_v3.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_team.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"ap-northeast-1"` | no |
| <a name="input_branch_protections"></a> [branch\_protections](#input\_branch\_protections) | branch protections | <pre>list(object({<br>    repository                    = string<br>    branch                        = string<br>    enforce_admins                = bool<br>    required_pull_request_reviews = optional(map(any), null)<br>    restrictions                  = optional(map(any), null)<br>  }))</pre> | `[]` | no |
| <a name="input_github_app_installations"></a> [github\_app\_installations](#input\_github\_app\_installations) | Install Github Application to a repository | <pre>list(object({<br>    repository      = string<br>    installation_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | GitHub org name | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | GitHub Repositories | <pre>list(object({<br>    name        = string<br>    description = string<br>    visibility  = optional(string, "private")<br>    auto_init   = optional(bool, true)<br>    branches    = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_repository_secrets"></a> [repository\_secrets](#input\_repository\_secrets) | Repository Secrets | <pre>list(object({<br>    repository  = string<br>    secret_name = string<br>    value       = string<br>  }))</pre> | `[]` | no |
| <a name="input_team_repository_permissions"></a> [team\_repository\_permissions](#input\_team\_repository\_permissions) | Repository permissions for team | <pre>list(object({<br>    repository = string<br>    team       = string<br>    permission = string<br>  }))</pre> | `[]` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | GitHub Org teams | <pre>list(object({<br>    name        = string<br>    description = string<br>    privacy     = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->