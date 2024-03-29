variable "aws_account_id" {
  description = "REQUIRED. The account ID for the AWS account in which the infrastructure will be provisioned."
  type        = string
}

variable "aws_region" {
  description = "The AWS region in which the infrastructure will be provisioned."
  type        = string
}

variable "bucket_name" {
  description = ""
  type        = string
}

variable "cloudfront_ttl" {
  description = "How many seconds an object remains in cache."
  type        = number
}

variable "domain_zone_id" {
  default     = null
  description = "DNS zone where host names will be created."
  type        = string
}

variable "github_repo_url" {
  description = ""
  type        = string
}

variable "lambda_arn" {
  description = ""
  type        = string
}

variable "name" {
  description = "The app name used for tagging infrastructure."
  type        = string
}

variable "name_prefix" {
  description = "The environment in which this infrastructure will be provisioned."
  type        = string
}

variable "origin_path" {
  default = null
  description = "Optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin."
  type = string
}

variable "tags" {
  default     = {}
  description = "A mapping of tags to assign to resources."
  type        = map(string)
}
