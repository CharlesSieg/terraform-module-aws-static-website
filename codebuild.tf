###################################################################
# S3 BUCKET
###################################################################

###################################################################
# CLOUDFRONT
###################################################################

module "website_codebuild" {
  account_id                 = var.aws_account_id
  app_name                   = var.name
  aws_region                 = var.aws_region
  bucket_id                  = aws_s3_bucket.bucket.id
  cloudfront_distribution_id = module.cloudfront.distribution_id
  environment                = var.name_prefix
  github_repo_url            = var.github_repo_url
  source                     = "git@github.com:CharlesSieg/terraform-module-aws-codebuild.git?ref=master"

  providers = {
    aws.tools = aws.tools
  }
}
