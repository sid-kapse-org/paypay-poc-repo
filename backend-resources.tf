resource "aws_s3_bucket" "tf_state" {
    bucket = "my-paypay-terraform-state-bucket"

    tags = {
        Name = "paypay Terraform state bucket"
        Environment = "var.environment"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "paypay_tf_lock" {
    name = "paypay-terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute{
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "paypay Terraform lock table"
        Environment = "var.environment"
    }
}