# Branch
locals {
  branches = flatten([
    for _, repo in var.repositories : [
      for _, branch in repo.branches : {
        repo   = repo.name
        branch = branch
      }
  ]])

  team_repository_permissions = {
    for ind, item in var.team_repository_permissions : ind => {
      repository = item.repository
      team_id    = github_team.this[item.team].id
      permission = item.permission
    }
  }
}

# GitHub OIDC
locals {
  github_oidc_repos = [for ind, item in var.github_oidc_repos : {
    owner      = var.github_owner
    repository = item
    }
  ]

  ecr_role_iam_policy = [
    {
      name = "ecr"
      json = data.aws_iam_policy_document.github_actions_ecr.json
    }
  ]

  oidc_repository_secrets = [
    for ind, item in var.github_oidc_repos : {
      repository  = item
      secret_name = "IAM_ROLE_ARN"
      value       = module.aws_github_oidc_iam_role.iam_role.arn
    }
  ]
  repository_secrets = concat(local.oidc_repository_secrets, var.repository_secrets)
}

