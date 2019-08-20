# terraform-aws-s3-object
Terraform module which creates S3 object resources on AWS

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucketname |  | string | `""` | no |
| destFileName |  | string | `""` | no |
| encrypt |  | string | `"false"` | no |
| kmsEncrypt |  | string | `"false"` | no |
| kmsKeyId |  | string | `""` | no |
| sourceFile |  | string | `""` | no |
| tags |  | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket |  |
| s3\_dest\_file |  |
| s3\_source\_file |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
