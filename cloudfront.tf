resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "CloudFront Identity for ${var.name}"
}

module "cloudfront" {
  aws_region             = var.aws_region
  bucket_name            = aws_s3_bucket.bucket.id
  cloudfront_ttl         = var.cloudfront_ttl
  lambda_arn             = var.lambda_arn
  name                   = var.name
  name_prefix            = var.name_prefix
  origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  source                 = "git@github.com:CharlesSieg/terraform-module-aws-cloudfront.git?ref=master"
  tags                   = var.tags
}

