# changes

variable "region" {}

variable "account_id" {
  default = "038462750799" 
}

variable "deploy_role" {
  default = "arn:aws:iam::038462750799:role/pp-deployment-role" # please replace with appropraite value
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
  default = "7thmindtech"
}

# variable "alb_arn" {}

variable "vpc_cidr" {}

variable "public_cidrs" {}

variable "app_priv_cidrs" {}

variable "db_priv_cidrs" {}

##########
# Cluster

variable "ecr_repo_name" {
  default = "ok-ecr-registry"
}
