resource "aws_s3_bucket" "bucket" {
  acl           = "private"
  bucket        = var.bucket_name
  force_destroy = true
  tags          = merge(var.tags, { Name = var.bucket_name })

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

