# RDS
Create a MySQL instance as an instance of AWS RDS


## Requires

Create a terraform.tfvars with the following entries:

```
profile       = "aws profile"
tfstatebucket = "s3 bucket name"
subnet_ids    = ["subnet-xxxxxxxx", ...]
instance-sg   = ["sg-xxxxxxxx", ...]
instance-type = "aws instance type"
vpc-id        = "vpc-xxxxxxxx"
external_ip   = "cidr to allow access to ssh"
common_tags = {
   Stack   = "Part of some stack"
   Purpose  = "A purpose for it"
   Origin = "Author"
}
```
