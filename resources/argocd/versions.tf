terraform {
  required_version = "~>1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.6.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.7.0"
    }
  }
}

