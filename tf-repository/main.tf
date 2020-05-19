terraform {
  required_version = "~> 0.12.20"

  backend "local" {}
}

provider "aws" {
  version                   = "~> 2.51"
  region                    = "ap-northeast-2"
  shared_credentials_file   = "~/.aws/credentials"
}

module "storage" {
  source = "./storage"
}

module "db" {
  source = "./db"
}