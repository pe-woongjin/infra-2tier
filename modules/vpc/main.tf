terraform {
  required_version  = "~> 0.12.20"

  backend "s3" {
    bucket          = "infra2tier-tfstates-mgmt"
    key             = "infra2tier/vpc/terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "infra2tier-lock-table"
    encrypt         = true
    acl             = "bucket-owner-full-control"
  }
}

provider "aws" {
  version                   = "~> 2.51"
  region                    = var.region_name
  shared_credentials_file   = "~/.aws/credentials"
}