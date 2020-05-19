terraform {
  required_version = "~> 0.12.20"

  backend "local" {}
}

provider "aws" {
  version                   = "~> 2.51"
  region                    = var.region_name
  shared_credentials_file   = "~/.aws/credentials"
}

module "storage" {
  source = "./storage"

  # common
  environment = var.environment

  # s3
  s3_log = var.s3_log
  s3_mgmt = var.s3_mgmt
}

module "db" {
  source = "./db"

  # common
  environment = var.environment

  # dynamo db
  dynamodb_tbl = var.dynamodb_tbl
}