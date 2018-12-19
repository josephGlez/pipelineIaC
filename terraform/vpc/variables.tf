//Global variables
variable "region" {
  default = "us-east-1"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default ="~/.aws/credentials"
  //this can be created by using the aws cli and running aws configure, enter the same access/secret as aws key
}

variable "aws_profile" {
  description = "AWS profile"
  default = "default"
  //this is the profile used in the aws shared credentials file
}

variable "hosted_zone_id" {
  description = "Route53 zone id"
  default = "Z1FRPTBR3V65LS"
  // must create a host zone through the AWS console, copy ID here
}

variable "joe_key_name" {
  description = "joe KeyName"
  default = "masterJenk"
  // this is the name of the key pair as defined in ec2/keypairs
}

variable "availability_zones" {
  type        = "list"
  default = ["us-east-1a",
      "us-east-1b",
      "us-east-1c",
      "us-east-1d",
      "us-east-1e",
      "us-east-1f"]
}

// Default variables
variable "vpc_name" {
  description = "VPC name"
  default     = "terraform-example-joe"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_count" {
  default     = 2
  description = "Number of public subnets"
}

variable "private_count" {
  default     = 2
  description = "Number of private subnets"
}

variable "joe_instance_type" {
  description = "joe Instance type"
  default     = "t2.micro"
}
