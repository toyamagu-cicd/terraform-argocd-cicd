terraform {
  required_version = "~>1.3"
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~>3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5"
    }
  }
}
