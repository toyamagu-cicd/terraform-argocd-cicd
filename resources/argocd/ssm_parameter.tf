# SSO client id
resource "aws_ssm_parameter" "client_id" {
  name        = "/${local.sso_credentials.name}/client_id"
  description = "SSO client id"
  type        = "SecureString"
  value       = "client_id"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

# SSO client secret
resource "aws_ssm_parameter" "client_secret" {
  name        = "/${local.sso_credentials.name}/client_secret"
  description = "SSO client secret"
  type        = "SecureString"
  value       = "client_secret"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

data "aws_ssm_parameter" "client_id" {
  name = aws_ssm_parameter.client_id.name
  depends_on = [
    null_resource.register_secret
  ]
}

data "aws_ssm_parameter" "client_secret" {
  name = aws_ssm_parameter.client_secret.name
  depends_on = [
    null_resource.register_secret
  ]
}


# If sso_credentials are set, exec script which register sso credentials to SSM parameter store.
resource "null_resource" "register_secret" {
  count = local.sso_credentials.is_set ? 1 : 0
  triggers = {
    run_always = timestamp()
  }
  provisioner "local-exec" {
    environment = {
      CLIENT_ID          = local.sso_credentials.values.client_id
      CLIENT_SECRET      = local.sso_credentials.values.client_secret
      CLIENT_ID_NAME     = aws_ssm_parameter.client_id.name
      CLIENT_SECRET_NAME = aws_ssm_parameter.client_secret.name
    }
    command     = "${path.cwd}/scripts/register_aws_ssm_pms.sh"
    interpreter = ["bash"]
  }
}

