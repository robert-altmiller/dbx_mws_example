# required terraform providers
terraform {
  required_providers {
    aws = "~> 3.0"
    databricks = {
      source = "databricks/databricks"
    }
  }
  required_version = ">=0.13"
}


provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key_id
  secret_key =  var.aws_access_key_secret
  default_tags {
    tags = {
      Owner    = var.resource_owner
      Resource = var.resource_prefix
    }
  }
}

provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = local.databricks_client_id
  client_secret = local.databricks_client_secret
}

provider "databricks" {
  alias         = "workspace"
  host          = local.databricks_instance
  account_id    = var.databricks_account_id
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
}

data "databricks_workspace" "this" {
}