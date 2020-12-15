resource "aws_s3_bucket" "redbucket" {
  bucket = var.tfstatebucket
  acl    = "private"

  tags = {
    Name        = "redbucket_ok_to_delete"
    Environment = "doit"
  }
}
