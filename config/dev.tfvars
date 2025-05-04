env = "dev"
region = "eu-west-1"
account_id = "038462750799"

#alb_arn = "arn:aws:elasticloadbalancing:eu-west-1:1227************"

vpc_cidr = "10.1.0.0/16"
public_cidrs = ["10.1.0.0/22", "10.1.4.0/22", "10.1.8.0/22"]
app_priv_cidrs = ["10.1.12.0/22", "10.1.16.0/22", "10.1.20.0/22"]
db_priv_cidrs = ["10.1.24.0/22", "10.1.28.0/22", "10.1.32.0/22"]

#ECS
stage_name = "v1"

