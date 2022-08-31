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

