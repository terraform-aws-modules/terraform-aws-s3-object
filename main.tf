resource "aws_s3_bucket_object" "object_with_kms_encryption" {
  count = "${var.kmsEncrypt == 1 ? 1 : 0}"
  bucket = "${var.bucketname}"
  key    = "${var.destFileName}"
  source = "${var.sourceFile}"
  server_side_encryption = "aws:kms"
  kms_key_id = "${var.kmsKeyId}"
}

resource "aws_s3_bucket_object" "object_without_encryption" {
  count = "${var.kmsEncrypt == 0 ? 1 : 0}"
  bucket = "${var.bucketname}"
  key    = "${var.destFileName}"
  source = "${var.sourceFile}"
}
