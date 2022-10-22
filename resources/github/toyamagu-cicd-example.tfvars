github_owner = "toyamagu-cicd"

repositories = [
  {
    description = "ArgoCD CICD Example Application Repository",
    name        = "argocd-cicd-application",
    visibility  = "public"
    branches    = ["dev"]
  },
  {
    description = "ArgoCD CICD Example K8s manifest Repository"
    name        = "argocd-cicd-k8s-manifest",
    visibility  = "public"
    branches    = ["dev"]
  }
]


teams = [
  {
    name        = "developer"
    description = "Developer team"
    privacy     = "closed"
  },
  {
    name        = "developer-leader"
    description = "Developer leaders team"
    privacy     = "closed"
  },
  {
    name        = "operator"
    description = "Operator team"
    privacy     = "closed"
  }
]

branch_protections = [
  {
    branch                        = "main"
    enforce_admins                = true
    repository                    = "argocd-cicd-application"
    restrictions                  = {}
    required_pull_request_reviews = {}
  },
  {
    branch         = "dev"
    enforce_admins = true
    repository     = "argocd-cicd-application"
  },
  {
    branch                        = "main"
    enforce_admins                = true
    repository                    = "argocd-cicd-k8s-manifest"
    restrictions                  = {}
    required_pull_request_reviews = {}
  },
  {
    branch         = "dev"
    enforce_admins = true
    repository     = "argocd-cicd-k8s-manifest"
  },
]

team_repository_permissions = [
  {
    repository = "argocd-cicd-application"
    team       = "developer-leader"
    permission = "maintain"
  },
  {
    repository = "argocd-cicd-application"
    team       = "developer"
    permission = "push"
  },
  {
    repository = "argocd-cicd-application"
    team       = "operator"
    permission = "maintain"
  },
  {
    repository = "argocd-cicd-k8s-manifest"
    team       = "developer-leader"
    permission = "push"
  },
  {
    repository = "argocd-cicd-k8s-manifest"
    team       = "developer"
    permission = "push"
  },
  {
    repository = "argocd-cicd-k8s-manifest"
    team       = "operator"
    permission = "maintain"
  },
]

github_app_installations = []

github_oidc_repos = ["argocd-cicd-application"]

ecr_repo_name = "cicd-example"

create_oidc_provider_github = true


# Initially, you should comment out following values.
# After GitHub repositories created and GitHub App installed, uncomment, edit and apply.
# repository_secrets = [
#   {
#     repository  = "argocd-cicd-application",
#     secret_name = "APP_ID",
#     value       = "<APP_ID>"
#   }
# ]

# organization_secret_from_file = [{
#   secret_filename = "github-app.pem"
#   secret_name     = "PEM_<APP_ID>"
#   visibility      = "selected"
#   repositories    = ["argocd-cicd-application"]
# }]
