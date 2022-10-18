variable "eks_version" {
  description = "EKS version"
  type        = string
  default     = "1.23"
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-cluster-with-argo"
}

variable "aws_default_tags" {
  description = "AWS default tags"
  type        = map(string)
  default = {
    Creator = "eks-cluster-with-argo"
  }
}

variable "k8s_manifest_repo" {
  description = "Argocd K8s manifest repository URL."
  type        = string
}

variable "source_cidrs" {
  description = "CIDRs for public access"
  type        = list(string)
  default     = [""]
}

variable "public_root_domain" {
  description = "Public root domain"
  type        = string
}

variable "sso_client_id" {
  description = "sso client id"
  type        = string
  default     = null
}

variable "sso_client_secret" {
  description = "sso client secret"
  type        = string
  default     = null
}

variable "github_org" {
  description = "GitHub organiztion for sso"
  type        = string
  default     = ""
}

variable "k8s_namespaces" {
  description = "K8s namespaces"
  type        = list(string)
  default     = []
}
