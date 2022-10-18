data "aws_iam_policy_document" "trusted_github_oidc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = var.oidc_provider_arns
    }

    condition {
      test     = length(var.github_oidc_repos) == 1 ? "StringLike" : "ForAnyValue:StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [for repo in var.github_oidc_repos : "repo:${repo.owner}/${repo.repository}:*"]
    }
  }
}

resource "aws_iam_policy" "this" {
  for_each    = { for ind, item in var.iam_policy : item.name => item }
  name        = each.value.name
  path        = "/github_oidc/"
  description = "Policy ${each.value.name} for GitHub OIDC."
  policy      = each.value.json
}

resource "aws_iam_role" "this" {
  name               = "githubactions-oidc-role"
  path               = "/github_oidc/"
  assume_role_policy = data.aws_iam_policy_document.trusted_github_oidc.json
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = aws_iam_policy.this
  role       = aws_iam_role.this.name
  policy_arn = each.value.arn
}
