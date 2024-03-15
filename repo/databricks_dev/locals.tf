locals {
  # dbricks instance url
  databricks_instance = lookup(var.databricks_instances, var.environment)
  # client id
  databricks_client_id = lookup(var.databricks_client_ids, var.environment)
  # client secret
  databricks_client_secret = lookup(var.databricks_client_secrets, var.environment)
  # aws workspace ida
  workspace_id = element(split("=", var.url), length(split("=", var.url)) - 1)
}