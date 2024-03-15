# deployment environment
variable "environment" {
  description = "deployment environment"
  type        = string
}

# aws access key id environment variable
variable "aws_account_id"{
  description = "AWS_ACCOUNT_ID secret passed from GitHub Actions"
  type        = string
}

# aws region environment variable
variable "aws_region" {
  description = "AWS_REGION secret passed from GitHub Actions"
  type        = string
}

# aws access key id environment variable
variable "aws_access_key_id"{
  description = "AWS_ACCESS_KEY secret passed from GitHub Actions"
  type        = string
}

# aws secret access key environment variable
variable "aws_access_key_secret" {
  description = "AWS_SECRET_ACCESS_KEY secret passed from GitHub Actions"
  type        = string
}

# databricks account id
variable "databricks_account_id" {
  description = "DATABRICKS_ACCOUNT_ID secret passed from GitHub Actions"
  type        = string
}

# databricks instance environment variable
# variable "databricks_instances" {
#   description = "maps of Databricks instances secret passed from GitHub Actions"
#   type        = map(string)
# }


# databricks client id environment variable (e.g. service principle id)
# variable "databricks_client_ids" {
#   description = "Map of Databricks client ids for different environments"
#   type = map(string)
# }

# databricks client secret environment variable (e.g. service principle secret)
# variable "databricks_client_secrets" {
#   description = "Map of Databricks client secrets for different environments"
#   type = map(string)
# }

# databricks token
# variable "databricks_token" {
#   description = "DATABRICKS_AUTH_TOKEN secret passed from Github Actions"
#   type = string
# }

variable "resource_prefix" {
  type        = string
  default = "alt"
}

variable "resource_owner" {
  type        = string
  default = "Robert Altmiller"
}

variable "team" {
  type        = string
  default = "RSA Team"
}

variable "user_name" {
  type        = string
  default = "robert.altmiller@databricks.com"
}
