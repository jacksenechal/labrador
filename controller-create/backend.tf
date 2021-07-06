terraform {
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
/*
  backend "s3" {
    region         = "us-west-2"
    encrypt        = true
    key            = "tftate/control"
    bucket         = "isoktodelete2602700jss"
    dynamodb_table = "tf-lock-dynamo"
  }
*/
}
