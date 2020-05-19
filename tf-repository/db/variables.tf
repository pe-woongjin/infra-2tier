# ######################
# COMMON
# ######################
variable "environment" {
  description = "Runtime Environment such as default, develop, stage, production"
  type = string
  default = "prd"
}


# ######################
# Dynamo DB
# ######################
variable "dynamodb_tbl" {
  description = "dynamo db table name"
  type = string
  default = "infra2tier-lock-table"
}