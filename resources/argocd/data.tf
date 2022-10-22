data "aws_route53_zone" "public" {
  name         = var.public_root_domain
  private_zone = false
}

# Public ip of terraform executor
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
