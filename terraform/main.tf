terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 0.94"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_organization_name
  account_name       = var.snowflake_account_name
  user               = var.snowflake_user
  password           = var.snowflake_password
  role               = "ACCOUNTADMIN"
}

resource "snowflake_warehouse" "lakehouse_wh" {
  name           = "LAKEHOUSE_WH"
  warehouse_size = "XSMALL"
  auto_suspend   = 60
  auto_resume    = true
}

resource "snowflake_database" "lakehouse_db" {
  name = "LAKEHOUSE_DB"
}

resource "snowflake_schema" "raw" {
  database = snowflake_database.lakehouse_db.name
  name     = "RAW"
}

resource "snowflake_schema" "staging" {
  database = snowflake_database.lakehouse_db.name
  name     = "STAGING"
}

resource "snowflake_schema" "marts" {
  database = snowflake_database.lakehouse_db.name
  name     = "MARTS"
}