# module "cloud_provider" {
#     source = "./cloud_provider"
#     providers = {
#         aws = aws
#         databricks = databricks.mws
#     }
#     aws_account_id        = var.aws_account_id
#     databricks_account_id = var.databricks_account_id
#     resource_prefix       = var.resource_prefix
#     region                = var.region
#     vpc_cidr_range        = var.vpc_cidr_range
#     availability_zones    = var.availability_zones
#     public_subnets_cidr   = var.public_subnets_cidr
#     private_subnets_cidr  = var.private_subnets_cidr
#     sg_ingress_protocol   = var.sg_ingress_protocol
#     sg_egress_ports       = var.sg_egress_ports
#     sg_egress_protocol    = var.sg_egress_protocol
#     dbfsname              = var.dbfsname
  
# }

# module "databricks_account" {
#     source = "./databricks_account"
#     providers = {
#         databricks = databricks.mws
#     }

#       databricks_account_id  = var.databricks_account_id
#       region                 = var.region
#       resource_prefix        = var.resource_prefix
#       cross_account_role_arn = module.cloud_provider.cloud_provider_credential
#       bucket_name            = module.cloud_provider.cloud_provider_storage
#       vpc_id                 = module.cloud_provider.cloud_provider_network_vpc
#       subnet_ids             = module.cloud_provider.cloud_provider_network_subnets
#       security_group_ids     = module.cloud_provider.cloud_provider_network_security_groups
#       metastore_id           = var.metastore_id
#       user_name              = var.user_name
  
# }


terraform {
  backend "s3" {
    bucket = "dbx-dev-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}


module "databricks_workspace" {
    source = "./databricks_workspace"
    providers = {
        aws = aws
        databricks = databricks.workspace
    }

    aws_account_id        = var.aws_account_id
    databricks_account_id = var.databricks_account_id
    resource_prefix       = var.resource_prefix
    workspace_id          = local.workspace_id
    uc_catalog_name       = "${var.resource_prefix}-catalog-${local.workspace_id}"
    workspace_catalog_admin = var.user_name
    team = var.team
  
}


# provider "databricks" {
#   // other configuration
#   provider = databricks.mws
#   account_id = var.databricks_account_id
# }

# data "databricks_mws_workspaces" "all" {}

# output "all_mws_workspaces" {
#   value = data.databricks_mws_workspaces.all.ids
# }
