# ######################
# COMMON
# ######################
variable "team_name" {
  type = string
}

variable "service_version" {
  type = string
}

variable "environment" {
  type = string
}

variable "resrc_prefix_nm" {
  type = string
}


# ######################
# VPC
# ######################
# vpc cidr block
variable "vpc_cidr_block" {
  type = string
}