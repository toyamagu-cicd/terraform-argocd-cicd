// naming
locals {
  name_common = var.eks_cluster_name
}

// EKS
locals {
  aws = {
    region       = var.aws_region
    default_tags = var.aws_default_tags
  }

  eks = {
    version      = var.eks_version
    cluster_name = var.eks_cluster_name
  }
}

//ArgoCD
locals {
  # ArgoCD helm chart values.yaml
  ## RBAC
  argocd_rbac_vars = {
    github_org = var.github_org
  }
  rbac_dev = templatefile("${path.module}/argocd/rbac-dev.tftpl.csv", local.argocd_rbac_vars)
  rbac_prd = templatefile("${path.module}/argocd/rbac-prd.tftpl.csv", local.argocd_rbac_vars)
  rbac_csv = <<-EOT
  ${local.rbac_dev}
  ${local.rbac_prd}
  EOT

  ## values.yaml
  argocd_helm_vars = {
    host       = "https://${local.dns_argocd}"
    github_org = var.github_org
    rbac_csv   = local.rbac_csv
  }
  helm_values = [templatefile("${path.module}/argocd/values.yaml", local.argocd_helm_vars)]

  # ArgoCD app helm chart values.yaml
  argocd_applications_vars = {
    repo_url = var.k8s_manifest_repo
  }
  argocd_applications = [
    templatefile("${path.module}/argocd/applications.tftpl.yaml", local.argocd_applications_vars)
  ]

  # ArgoCD project helm chart values.yaml
  argocd_projects_vars = {
  }
  argocd_projects = [
    templatefile("${path.module}/argocd/projects.tftpl.yaml", local.argocd_projects_vars)
  ]
}

//VPC
locals {
  vpc = {
    cidr            = "10.0.0.0/16"
    secondary_cidr  = ["100.64.0.0/16"]
    azs             = ["${local.aws.region}a", "${local.aws.region}c", "${local.aws.region}d"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    intra_subnets   = ["100.64.1.0/24", "100.64.2.0/24", "100.64.3.0/24"]
    public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  }
}

// EKS用ALB
locals {
  alb_eks_name = format(
    "%s",
    local.name_common
  )

  dns_argocd = format(
    "%s.%s",
    "argocd",
    var.public_root_domain
  )
  dns_app = format(
    "%s.%s",
    "sample-app",
    var.public_root_domain
  )

  alb_target_group_argo = format(
    "%s-argo",
    local.alb_eks_name
  )

  alb = {
    name = local.alb_eks_name
    target_group = {
      argo = local.alb_target_group_argo
    }
  }
}

// SSO
locals {
  // Secrets Manager

  client_id     = try(var.sso_client_id, null)
  client_secret = try(var.sso_client_secret, null)

  sso_credentials = {
    name = "${var.eks_cluster_name}-sso"
    values = {
      client_id     = local.client_id
      client_secret = local.client_secret
    }
    is_set = (local.client_id != null && local.client_secret != null ? true : false)
  }
}

// Source cidrs for public access
locals {
  source_cidrs = concat(["${chomp(data.http.myip.response_body)}/32"], var.source_cidrs)
}
