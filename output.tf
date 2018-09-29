output "s3_bucket" {
  value = "${element(concat(aws_s3_bucket_object.object_with_kms_encryption.*.bucket, aws_s3_bucket_object.object_without_encryption.*.bucket, list("")), 0)}"
}

output "s3_dest_file" {
  value = "${element(concat(aws_s3_bucket_object.object_with_kms_encryption.*.key, aws_s3_bucket_object.object_without_encryption.*.key, list("")), 0)}"
}

output "s3_source_file" {
  value = "${element(concat(aws_s3_bucket_object.object_with_kms_encryption.*.source, aws_s3_bucket_object.object_with_kms_encryption.*.source, list("")), 0)}"
}

