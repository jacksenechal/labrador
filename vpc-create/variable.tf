variable "profile" {
  type        = string
  description = "AWS profile to be used"
}

variable "region1" {
  type        = string
  default     = "us-east-1"
  description = "North Virginia Region"
}

variable "region2" {
  type        = string
  default     = "us-west-2"
  description = "Oregon Region"
}

variable "tfstatebucket" {
  type        = string
  description = "S3 bucket to keep the terraform state"
}

variable "common_tags" {
  description = "Base tags for all resources"
  type        = map(any)
}

variable "vpc_cidr" {
  description = "The CIDR block to be used by the VPC"
  type        = string
}

# https://www.terraform.io/docs/configuration/functions/cidrsubnet.html
variable "subnet_cidr_newbits" {
  type        = string
  default     = 4
  description = "The newbits value as per cidrsubnet function docs"
}
