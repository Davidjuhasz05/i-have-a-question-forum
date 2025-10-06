variable "region" {
  description = "Region for the provider"
  type = string
  default = "eu-north-1"
}

variable "aws_access_key" {
  description = "Access key for the preferred AWS user"
  type = string
}

variable "aws_secret_key" {
  description = "Secret key for the preferred AWS user"
  type = string
}

variable "project_name" {
  description = "This value will be used as a tag for the related AWS resources!"
  type = string
}