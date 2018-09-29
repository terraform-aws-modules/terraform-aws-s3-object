# Main execution pipe, take module, pass variables to it and run it
data_source "s3_bucket" {
  name = "s3-bucket"
}

module "s3_object" {
  # Bucket name where all files present
  bucket-name = "${var.s3_bucket.name}"
  # Source to push to the bucket
  bucket-source = "module/s3_object"
}
