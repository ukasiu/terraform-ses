provider "aws" {
  region = "${var.region}"
  alias  = "module"
}

resource "aws_ses_domain_identity" "domain" {
  provider = "aws.module"
  domain   = "${var.domain}"
}

resource "aws_ses_domain_dkim" "dkim" {
  provider = "aws.module"
  domain = "${aws_ses_domain_identity.domain.domain}"
}
