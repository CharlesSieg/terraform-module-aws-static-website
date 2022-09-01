module "website_urls" {
  count = var.domain_zone_id == null ? 0 : 1

  alias_hosted_zone_id = module.cloudfront.hosted_zone_id
  alias_name           = module.cloudfront.domain_name
  domain_zone_id       = var.domain_zone_id
  name                 = aws_s3_bucket.bucket.id
  source               = "git@github.com:CharlesSieg/terraform-module-aws-route53.git?ref=master"

  providers = {
    aws.dnsProvider = aws.dnsProvider
  }
}
