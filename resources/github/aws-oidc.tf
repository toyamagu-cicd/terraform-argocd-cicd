module "aws_github_oidc" {
  source                      = "../../modules/aws-github-oidc"
  create_oidc_provider_github = var.create_oidc_provider_github
}

module "aws_github_oidc_iam_role" {
  source             = "../../modules/aws-github-oidc-iam-role/"
  github_oidc_repos  = local.github_oidc_repos
  iam_policy         = local.ecr_role_iam_policy
  oidc_provider_arns = [module.aws_github_oidc.oidc_provider.arn]
}

data "aws_iam_policy_document" "github_actions_ecr" {
  // allow running `aws sts get-caller-identity`
  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
}

resource "aws_ecr_repository" "cicd-sample" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}
