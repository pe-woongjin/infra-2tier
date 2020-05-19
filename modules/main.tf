terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket          = "infra2tier-tfstates-mgmt"
    key             = "infra2tier/base/terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "infra2tier-lock-table"
    encrypt         = true
    acl             = "bucket-owner-full-control"
  }
}

provider "aws" {
  version                   = "~> 2.51"
  region                    = "ap-northeast-2"
  shared_credentials_file   = "~/.aws/credentials"
}

module "vpc" {
  source = "./vpc"
}

module "elb" {
  source = "./elb"

  # vpc
  vpc_id = module.vpc.vpc_id

  # subnets
  pub_sn_ids = module.vpc.pub_sn_ids
}

module "iam" {
  source = "./iam"
}