provider "github" {
  owner = var.github_owner
}

terraform {
  backend "s3" {}
}
