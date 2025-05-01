variable "project_name" {}

variable "env" {
    description = "[REQUIRED] Environment:"
    default     = ""
}

variable "app_alb_arn" {}

variable "project" {
  default = "Okyke"
}

variable "owner" {
  default = "Okyke"
}

variable "repository" {
  default = "ok-vpc-infra"
}

variable "cust_name" {
  default = "ok"
}