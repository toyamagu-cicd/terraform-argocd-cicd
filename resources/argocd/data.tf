data "aws_route53_zone" "public" {
  name         = var.public_root_domain
  private_zone = false
}

# Public ip of terraform executor
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
