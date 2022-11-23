<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~>4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4 |
| <a name="provider_http"></a> [http](#provider\_http) | ~>3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~>4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |
| [http_http.github_actions_openid_configuration](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [tls_certificate.github_actions](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_oidc_provider_github"></a> [create\_oidc\_provider\_github](#input\_create\_oidc\_provider\_github) | Flag to create OIDC provider for GitHub | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | OIDC provider |
<!-- END_TF_DOCS -->