output "s3_bucket" {
  value = aws_s3_bucket.redbucket.id
}

output "tf_lock" {
  value = aws_dynamodb_table.dynamodb-tf-state-lock.name
}
