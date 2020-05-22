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
# Output
# ######################
# vpc
variable "vpc_id" {
  type = string
}

# public subnet ids
variable "pub_sn_ids" {
  type = list(string)
}