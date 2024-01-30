# terraform-module-aws-static-website
A Terraform module for creating a static website using S3, CloudFront, and Lambda@Edge.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | git@github.com:CharlesSieg/terraform-module-aws-cloudfront.git | master |
| <a name="module_website_codebuild"></a> [website\_codebuild](#module\_website\_codebuild) | git@github.com:CharlesSieg/terraform-module-aws-codebuild.git | master |
| <a name="module_website_urls"></a> [website\_urls](#module\_website\_urls) | git@github.com:CharlesSieg/terraform-module-aws-route53.git | master |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_identity.origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_iam_policy_document.policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | REQUIRED. The account ID for the AWS account in which the infrastructure will be provisioned. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which the infrastructure will be provisioned. | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_cloudfront_ttl"></a> [cloudfront\_ttl](#input\_cloudfront\_ttl) | How many seconds an object remains in cache. | `number` | n/a | yes |
| <a name="input_domain_zone_id"></a> [domain\_zone\_id](#input\_domain\_zone\_id) | DNS zone where host names will be created. | `string` | `null` | no |
| <a name="input_github_repo_url"></a> [github\_repo\_url](#input\_github\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The app name used for tagging infrastructure. | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The environment in which this infrastructure will be provisioned. | `string` | n/a | yes |
| <a name="input_origin_path"></a> [origin\_path](#input\_origin\_path) | Optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->