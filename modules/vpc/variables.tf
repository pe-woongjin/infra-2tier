# ######################
# COMMON
# ######################
variable "team_name" {
  description = "team name of DevOps"
  type = string
  default = "PE"
}

variable "service_name" {
  description = "name of service"
  type = string
  default = "infra2tier"
}

variable "service_version" {
  description = "version of service"
  type = string
  default = "0.1"
}

variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
  default = "prd"
}

variable "region_nm" {
  description = "aws region alias"
  type = string
  default = "apne2"
}

locals {
  resrc_prefix_nm =  "${var.service_name}-${var.region_nm}-${var.environment}"
}


# ######################
# VPC
# ######################
# vpc cidr block
variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  type = string
  default = "10.40.0.0/16"
}


# ######################
# Subnet
# ######################
# public subnet
variable "pub_sn_list" {
  description = "public subnets"
  type = list(map(string))
  default = [
    {
      cidr_block = "10.40.10.0/24",
      availability_zone = "ap-northeast-2a",
      Name = "pub-1a-sn"
    },
    {
      cidr_block = "10.40.11.0/24",
      availability_zone = "ap-northeast-2c",
      Name = "pub-1c-sn"
    }
  ]
}


# ######################
# Route Table
# ######################
# public route table
variable "public_rt_tag_names" {
  description = "tag name for public route table"
  type = list(map(string))
  default = [
    {
      Name = "pub-rt"
    }
  ]
}