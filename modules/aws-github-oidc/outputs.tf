output "oidc_provider" {
  description = "OIDC provider"
  value       = data.aws_iam_openid_connect_provider.github
}
