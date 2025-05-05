provider "aws" {
  region = var.region
  assume_role {
    # role_arn = var.DEPLOY_ROLE
    role_arn = var.deploy_role
  }
}

terraform {
  required_providers {
    aws = "<= 4.32.0"
  }

  backend "s3" {
    encrypt = true

    bucket         = "ok-terraform-remote-state-bucket" 
    dynamodb_table = "ok-terraform-locks"        
    region         = "eu-west-1"
    key            = "ok-vpc-infra/{{ENV}}/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:eu-west-1:038462750799:key/cd726a7f-456b-444a-86e5-880b261180b2"
  }
}

# data "terraform_remote_state" "app_backend" {
#   backend = "s3"

#   config = {
#     bucket = "ok-terraform-remote-state-bucket"
#     key    = "ok-app-backend/${var.env}/terraform.tfstate"
#     region = "eu-west-1"
#   }
# }

