resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = merge(var.tags, { Name = var.bucket_name })
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.bucket.bucket.id

  error_document {
    key = "404.html"
  }

  index_document {
    suffix = "index.html"
  }
}
