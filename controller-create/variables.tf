variable "profile" {
  type = string
}

variable "region1" {
  type    = string
  default = "us-east-1"
}

variable "region2" {
  type    = string
  default = "us-west-2"
}

variable "tfstatebucket" {
  type = string
}

variable "subnet_ids" {
  description = "Existing subnets"
  type        = list(any)
}

variable "first-contact" {
  description = "Deploy zero day access ssh public key"
  type        = map(any)
}

variable "instance-type" {
  description = "AWS instance type"
  type        = string
}

variable "instance-tag-name" {
  description = "Tag name for the instance. This should be unique-ish, to not conflict with other instances."
  type        = string
}

variable "author-initials" {
  description = "Your initials, for use in naming policies, etc"
  type        = string
}

variable "vpc-id" {
  description = "VPC id"
  type        = string
}

variable "external_ip" {
  description = "IP range to allow ssh"
  type        = string
}

variable "common_tags" {
  description = "Base tags for all resources"
  type        = map(any)
}
