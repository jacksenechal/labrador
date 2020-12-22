resource "aws_s3_bucket" "redbucket" {
  bucket = var.tfstatebucket
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "redbucket_ok_to_delete"
    Environment = "doit"
  }
}

resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
  name           = "tf-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}
