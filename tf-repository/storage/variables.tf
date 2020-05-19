# ######################
# COMMON
# ######################
variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
  default = "prd"
}


# ######################
# S3
# ######################
variable "s3_log" {
  description = "s3 log bucket name"
  type = string
  default = "terraform-tfstates-log"
}

variable "s3_mgmt" {
  description = "s3 mgmt bucket name"
  type = string
  default = "terraform-tfstates-mgmt"
}