provider "aws" {
  alias = "dnsProvider"
}

provider "aws" {
  alias = "tools"
}

###################################################################
# S3 BUCKET
###################################################################

resource "aws_s3_bucket" "bucket" {
  acl           = "private"
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Billing     = var.environment
    Environment = var.environment
    Terraform   = "true"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

###################################################################
# CLOUDFRONT
###################################################################

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

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
  }

  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.bucket.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

// Create a bucket policy allowing the tools account to put objects into the bucket.
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.policy_document.json
}

module "website_urls" {
  alias_hosted_zone_id = module.cloudfront.hosted_zone_id
  alias_name           = module.cloudfront.domain_name
  domain_zone_id       = var.domain_zone_id
  name                 = aws_s3_bucket.bucket.id
  providers = {
    aws.dnsProvider = aws.dnsProvider
  }
  source = "git@github.com:CharlesSieg/terraform-module-aws-route53.git?ref=master"
}

module "website_codebuild" {
  account_id                 = var.account_id
  app_name                   = var.app_name
  aws_region                 = var.aws_region
  bucket_id                  = aws_s3_bucket.bucket.id
  cloudfront_distribution_id = module.cloudfront.distribution_id
  environment                = var.environment
  github_repo_url            = var.github_repo_url
  providers = {
    aws.tools = aws.tools
  }
  source = "git@github.com:CharlesSieg/terraform-module-aws-codebuild.git?ref=master"
}
