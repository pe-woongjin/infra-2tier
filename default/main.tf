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

  team_name         = var.team_name
  environment       = var.environment
  service_version   = var.service_version
  resrc_prefix_nm   = local.resrc_prefix_nm
  vpc_cidr_block    = var.vpc_cidr_block
}

module "iam" {
  source = "./modules/iam"

  environment       = var.environment
  resrc_prefix_nm   = local.resrc_prefix_nm
}

module "elb" {
  source = "./modules/elb"

  environment       = var.environment
  resrc_prefix_nm   = local.resrc_prefix_nm
  vpc_id            = module.vpc.vpc_id
  pub_sn_ids        = module.ming.pub_sn_ids
}

module "ming" {
  source = "./services/ming"

  environment           = var.environment
  resrc_prefix_nm       = local.resrc_prefix_nm
  pub_sn_list           = var.pub_sn_list
  public_rt_tag_names   = var.public_rt_tag_names
  vpc_id                = module.vpc.vpc_id
}