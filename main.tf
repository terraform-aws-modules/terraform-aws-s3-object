# Main execution pipe, take module, pass variables to it and run it
data "aws_s3_bucket" "bucket" {
  bucket = "set_dns_name_here"
}

module "s3_object" {
  source = "module/"
  # Bucket name where all files present
  bucket-name = "${data.aws_s3_bucket.bucket.bucket_domain_name}"
  # Source to push to the bucket
  bucket-source = "source/index.html"
  bucket-key = "${data.aws_s3_bucket.bucket.bucket_domain_name}"
}
