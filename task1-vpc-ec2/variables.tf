# # ---------------------------------------------------------------------------------------------------------------------
# # MANDATORY PARAMETERS
# # ---------------------------------------------------------------------------------------------------------------------

# variable "access_key" {
#   description = "AWS Access Key"
#   type = string
# }

# variable "secret_key" {
#   description = "AWS Secret Key"
#   type = string
# }

# variable "region" {
#   description = "AWS Region"
#   type = string
# }

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_cidr" {
    description = "IP CIDR range for the Security VPC"
    type = string
}

variable "cidr_block_public" {
    description = "us-east-1a Availability zone"
    type = string
}

variable "availability_zone_public" {
    description = "us-east-1a Availability zone"
    type = string 
}

variable "cidr_block_private" {
    description = "us-east-1a Availability zone"
    type = string
}

variable "availability_zone_private" {
    description = "us-east-1b Availability zone"
    type = string 
}

variable "key_pair_name" {
  description = "Name for the SSH key pair"
  type        = string
}