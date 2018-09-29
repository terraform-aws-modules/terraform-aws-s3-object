# Required variables
variable "bucket-name" {}

variable "bucket-key" {}

variable "bucket-source" {
  type = "list"
}

# Optional variables
# full list - https://www.terraform.io/docs/providers/aws/r/s3_bucket_object.html#argument-reference
variable "website_redirect" {
  default = "false"
}

variable "storage_class" {
  default = "STANDARD"
}

variable "acl" {
  default = "private"
}

variable "is-base64" {
  default = "false"
}

variable "cache-control" {
  default = "max-age: 1 year"
}
