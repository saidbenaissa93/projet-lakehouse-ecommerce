variable "snowflake_organization_name" {
  description = "Nom de l'organisation Snowflake"
  type        = string
}

variable "snowflake_account_name" {
  description = "Nom du compte Snowflake"
  type        = string
}

variable "snowflake_user" {
  description = "Utilisateur Snowflake"
  type        = string
}

variable "snowflake_password" {
  description = "Mot de passe Snowflake"
  type        = string
  sensitive   = true
}