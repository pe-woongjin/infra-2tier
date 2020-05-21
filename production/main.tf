terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket          = "terraform-tfstates-mgmt"
    key             = "terraform/infra-2tier/base/terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "terraform-lock-table"
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
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "elb" {
  source = "./modules/elb"

  # vpc
  vpc_id = module.vpc.vpc_id

  # subnets
  pub_sn_ids = module.ming.pub_sn_ids
}

module "ming" {
  source = "./services/ming"

  # vpc
  vpc_id = module.vpc.vpc_id
}