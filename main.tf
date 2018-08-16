provider "aws" {
  region = "${var.region}"
  alias  = "module"
}

resource "aws_ses_domain_identity" "domain" {
  domain = var.domain
  provider = aws.module
}

resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.domain.domain
  provider = aws.module
}
