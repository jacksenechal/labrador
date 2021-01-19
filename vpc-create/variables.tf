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

variable "common_tags" {
  description = "Base tags for all resources"
  type        = map(any)
}

# VPC CIDR block
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block to be used by the VPC"
}

# The number of bits to extend VPC's CIDR as per 
# https://www.terraform.io/docs/configuration/functions/cidrsubnet.html
variable "subnet_cidr_newbits" {
  type        = string
  default     = 4
  description = "The newbits value as per cidrsubnet function docs"
}
