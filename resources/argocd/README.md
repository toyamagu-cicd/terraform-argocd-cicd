# tests/eks

## Usage

1. Create backend setting file.
    - `cp example.backend.hcl backend.hcl`
1. Set terraform var. One can choose options:
    1. Create tfvars: `cp example.tfvars example.auto.tfvars`
    1. Set `TF_VAR` environment variables (Reccomended for CI/CD)
1. Terraform init: `terraform init -backend-config backend.hcl`
1. Terraform apply: `terraform apply`


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~>3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.14.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd"></a> [argocd](#module\_argocd) | github.com/toyamagu-2021/terraform-kubernetes-bootstrap-argocd | v0.0.1 |
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 18.29.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.4 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_acm_certificate_validation.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_autoscaling_attachment.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_lb.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_certificate.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_listener_rule.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.argo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.argo_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.client_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.client_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [null_resource.register_secret](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_route53_zone.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_ssm_parameter.client_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.client_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_default_tags"></a> [aws\_default\_tags](#input\_aws\_default\_tags) | AWS default tags | `map(string)` | <pre>{<br>  "Creator": "eks-cluster-with-argo"<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"ap-northeast-1"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | EKS cluster name | `string` | `"eks-cluster-with-argo"` | no |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | EKS version | `string` | `"1.23"` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitHub organiztion for sso | `string` | `""` | no |
| <a name="input_k8s_manifest_repo"></a> [k8s\_manifest\_repo](#input\_k8s\_manifest\_repo) | Argocd K8s manifest repository URL. | `string` | n/a | yes |
| <a name="input_k8s_namespaces"></a> [k8s\_namespaces](#input\_k8s\_namespaces) | K8s namespaces | `list(string)` | `[]` | no |
| <a name="input_public_root_domain"></a> [public\_root\_domain](#input\_public\_root\_domain) | Public root domain | `string` | n/a | yes |
| <a name="input_source_cidrs"></a> [source\_cidrs](#input\_source\_cidrs) | CIDRs for public access | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_sso_client_id"></a> [sso\_client\_id](#input\_sso\_client\_id) | sso client id | `string` | `null` | no |
| <a name="input_sso_client_secret"></a> [sso\_client\_secret](#input\_sso\_client\_secret) | sso client secret | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_apps_helm_values"></a> [argocd\_apps\_helm\_values](#output\_argocd\_apps\_helm\_values) | n/a |
| <a name="output_argocd_helm_values"></a> [argocd\_helm\_values](#output\_argocd\_helm\_values) | n/a |
<!-- END_TF_DOCS -->