resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "CloudFront Identity for ${var.app_name}"
}

module "cloudfront" {
  app_name               = var.app_name
  aws_region             = var.aws_region
  bucket_name            = aws_s3_bucket.bucket.id
  cloudfront_ttl         = var.cloudfront_ttl
  environment            = var.environment
  origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  source                 = "git@github.com:CharlesSieg/terraform-module-aws-cloudfront.git?ref=master"
}

