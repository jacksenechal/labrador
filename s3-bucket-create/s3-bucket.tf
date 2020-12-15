resource "aws_s3_bucket" "redbucket" {
  bucket = "isoktodelete908098"
  acl    = "private"

  tags = {
    Name        = "redbucket_ok_to_delete"
    Environment = "doit"
  }
}
