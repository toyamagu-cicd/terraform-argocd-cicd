<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.trusted_github_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_oidc_repos"></a> [github\_oidc\_repos](#input\_github\_oidc\_repos) | GitHub OIDC repositories | <pre>list(object({<br>    owner      = string<br>    repository = string<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_iam_policy"></a> [iam\_policy](#input\_iam\_policy) | AWS IAM Policy | <pre>list(object({<br>    name = string<br>    json = string<br>  }))</pre> | n/a | yes |
| <a name="input_oidc_provider_arns"></a> [oidc\_provider\_arns](#input\_oidc\_provider\_arns) | OIDC provider arns | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM Role |
<!-- END_TF_DOCS -->