# ######################
# COMMON
# ######################
variable "environment" {
  type = string
}

variable "resrc_prefix_nm" {
  type = string
}


# ######################
# Subnet
# ######################
# public subnet
variable "pub_sn_list" {
  type = list(map(string))
}


# ######################
# Route Table
# ######################
# public route table
variable "public_rt_tag_names" {
  type = list(map(string))
}


# ######################
# Output
# ######################
# vpc
variable "vpc_id" {
  type = string
}