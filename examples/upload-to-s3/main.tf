provider "aws" {
  region = "eu-west-1"
}

resource "aws_kms_key" "this" {}

// Upload file without encryption
module "s3-object" {
  source = "../../"
  bucketname = "test"
  sourceFile = "test.txt"
  destFileName = "test-1.txt"
}

// Upload and ecnrypt with kms encryption
module "s3-encrypted-object" {
  source = "../../"
  bucketname = "test"
  sourceFile = "test.txt"
  destFileName = "test-1.txt"
  kmsEncrypt = true
  kmsKeyId = "${aws_kms_key.this.id}"
}
