provider "aws" {
  region = "eu-west-1"
}

provider "random" {}

resource "random_string" "random" {
  length    = 16
  special   = false
  min_lower = 16
}

resource "aws_kms_key" "this" {}

resource "aws_s3_bucket" "that" {
  bucket = "${random_string.random.result}"
}

// Upload file without encryption
module "s3-object" {
  source       = "../../"
  bucketname   = "${aws_s3_bucket.that.bucket}"
  sourceFile   = "test.txt"
  destFileName = "test-1.txt"
}

// Upload and encrypt with kms encryption
module "s3-encrypted-object" {
  source       = "../../"
  bucketname   = "${aws_s3_bucket.that.bucket}"
  sourceFile   = "test.txt"
  destFileName = "test-2.txt"
  encrypt      = true
  kmsEncrypt   = true
  kmsKeyId     = "${aws_kms_key.this.arn}"
}

// Upload and encrypt with AES-256 encryption
module "s3-encrypted-object" {
  source       = "../../"
  bucketname   = "${aws_s3_bucket.that.bucket}"
  sourceFile   = "test.txt"
  destFileName = "test-2.txt"
  encrypt      = true
}
