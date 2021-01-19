# S3 terraform state backend

It creates the an initial state backend s3 bucket for terraform.

It creates a dynomodb table to hold a lock.

## About input

Populate a terraform.tfvars with the following entries:

```
profile = "aws profile"
tfstatebucket = "s3 bucket name"
```