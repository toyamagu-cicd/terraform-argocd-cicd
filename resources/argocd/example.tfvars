argocd_apps_target_revision = "main"
public_root_domain          = "example.com"
github_org                  = "test-org"

k8s_manifest_repo = "https://github.com/toyamagu-cicd-example/argocd-cicd-application"
k8s_namespaces    = ["nginx-ingress", "dev", "prd"]
