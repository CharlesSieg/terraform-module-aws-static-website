###################################################################
# S3 BUCKET
###################################################################

###################################################################
# CLOUDFRONT
###################################################################

module "website_codebuild" {
  account_id                 = var.aws_account_id
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
