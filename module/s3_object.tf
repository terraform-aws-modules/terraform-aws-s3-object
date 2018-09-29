# AWS plain object, without encryption, non BASE64
resource "aws_s3_bucket_object" "plain-object" {
  count            = "${var.is-base64 == "" ? 0 : 1}"
  bucket           = "${var.bucket-name}"
  key              = "${var.bucket-key}"
  source           = "${var.bucket-source}"
  website_redirect = "${var.website_redirect}"
  storage_class    = "${var.storage_class}"
  acl              = "${var.acl}"
  etag             = "${md5(file("${var.bucket-source}"))}"
  cache_control    = "${var.cache-control}"
}

# AWS plain object, without encryption, with BASE64
resource "aws_s3_bucket_object" "base64-object" {
  count          = "${var.is-base64 == "" ? 1 : 0}"
  bucket         = "${var.bucket-name}"
  key            = "${var.bucket-key}"
  content_base64 = "${var.bucket-source}"

  etag             = "${md5(file("${var.bucket-source}"))}"
  website_redirect = "${var.website_redirect}"
  storage_class    = "${var.storage_class}"
  acl              = "${var.acl}"
  etag             = "${md5(file("${var.bucket-source}"))}"
  cache_control    = "${var.cache-control}"
}
