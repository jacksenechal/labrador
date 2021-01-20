# Terraform and Ansible Controller Node
Node that can be deploy as a controller node to deploy infrastructure using Terraform with Ansible.

It does have an instance role attached to it with fine-grained permissions to what it can deploy.


## Requires

Create a terraform.tfvars with the following entries:

```
profile       = "aws profile"
tfstatebucket = "s3 bucket name"
subnet_ids    = ["subnet-xxxxxxxx", ...]
first-contact = { "name" = "key_pair_name", "path" = "path/to/public_key" }
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
