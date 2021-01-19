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

variable "instance-sg" {
  description = "Security Groups for the app"
  type        = list(string)
}

variable "instance-type" {
  description = "AWS instance type"
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
