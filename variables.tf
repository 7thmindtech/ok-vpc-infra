# changes

variable "region" {}

variable "account_id" {}

variable "deploy_role" {
  default = "pp-deployment-role"
}

variable "devops_account_id" {
  default = "038462750799" 
}

variable "cust_name" {
  default = "ok"
}
variable "env" {
  default = "dev"
}
variable "project" {
  default = "Okyke"
}
variable "repository" {
  default = "ok-vpc-infra"
}
variable "owner" {
  default = "Okyke"
}

variable "alb_arn" {}

variable "vpc_cidr" {}

variable "public_cidrs" {}

variable "app_priv_cidrs" {}

variable "db_priv_cidrs" {}
