resource "aws_s3_bucket_object" "object_with_kms_encryption" {
  count                  = "${var.encrypt == 1 && var.kmsEncrypt == 1}"
  bucket                 = "${var.bucketname}"
  key                    = "${var.destFileName}"
  source                 = "${var.sourceFile}"
  server_side_encryption = "aws:kms"
  kms_key_id             = "${var.kmsKeyId}"

  tags = "${var.tags}"
}

resource "aws_s3_bucket_object" "object_with_aes_256_encryption" {
  count                  = "${var.encrypt == 1 && var.kmsEncrypt == 0}"
  bucket                 = "${var.bucketname}"
  key                    = "${var.destFileName}"
  source                 = "${var.sourceFile}"
  server_side_encryption = "AES256"

  tags = "${var.tags}"
}

resource "aws_s3_bucket_object" "object_without_encryption" {
  count  = "${var.encrypt == 0}"
  bucket = "${var.bucketname}"
  key    = "${var.destFileName}"
  source = "${var.sourceFile}"

  tags = "${var.tags}"
}
