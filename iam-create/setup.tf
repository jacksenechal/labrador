terraform {
  required_version = ">=0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    region         = "us-east-1"
    encrypt        = true
    key            = "tftate/tfmanage"
    bucket         = "isoktodelete908098"
    dynamodb_table = "tf-lock-dynamo"
  }
}
