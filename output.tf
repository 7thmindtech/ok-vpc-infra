output "vpc_id" {
  value = aws_vpc.main.id
}

output "pub_sub_1" {
  value = element(aws_subnet.public_subnet.*.id, 1)
}

output "pub_sub_2" {
  value = element(aws_subnet.public_subnet.*.id, 2)
}

output "pub_sub_3" {
  value = element(aws_subnet.public_subnet.*.id, 3)
}

output "app_priv_sub_1" {
  value = element(aws_subnet.app_priv_subnet.*.id, 1)
}

output "app_priv_sub_2" {
  value = element(aws_subnet.app_priv_subnet.*.id, 2)
}

output "app_priv_sub_3" {
  value = element(aws_subnet.app_priv_subnet.*.id, 3)
}

output "db_priv_sub_1" {
  value = element(aws_subnet.db_priv_subnet.*.id, 1)
}

output "db_priv_sub_2" {
  value = element(aws_subnet.db_priv_subnet.*.id, 2)
}

output "db_priv_sub_3" {
  value = element(aws_subnet.db_priv_subnet.*.id, 3)
}

output "alb_access_log_bucket" {
  value = aws_s3_bucket.ok-backup.arn
}

# output "gtw_endpoint" {
#   value = aws_vpc_endpoint.s3.id
# }

# output "intf_endpoint_ssm" {
#   value = aws_vpc_endpoint.ssm.id
# }

# output "intf_endpoint_ssmmessages" {
#   value = aws_vpc_endpoint.ssmmessages.id
# }

# output "intf_endpoint_ec2messages" {
#   value = aws_vpc_endpoint.ec2messages.id
# }

# output "intf_endpoint_cwlog" {
#   value = aws_vpc_endpoint.cwlog.id
# }

output "default_route_tbl" {
  value = aws_default_route_table.default_route_tab.id
}

output "pub_route_tbl" {
  value = aws_route_table.pub_route_tab.id
}

# output "priv_route_tbl" {
#   value = aws_route_table.priv_route_tab.id
# }


# output "nat-gw" {
#   value = aws_nat_gateway.nat-gw.id
# }

output "igw" {
  value = aws_internet_gateway.gw.id
}

output "pub_sub_sg" {
  value = aws_security_group.pub-sub-sg.id
}

output "priv_sub_sg" {
  value = aws_security_group.priv-sub-sg.id
}

output "db_sub_sg" {
  value = aws_security_group.db-sub-sg.id
}

output "endpt-sg" {
  value = aws_security_group.endpt-sg.id
}

output "ecs_sub_sg" {
  value = aws_security_group.ecs-sub-sg.id
}

output "alb_sg" {
  value = aws_security_group.ok_alb_sg.id
}

output "alb_arn" {
  value = aws_lb.ok-alb.arn
}

output "ok_backend_ecr_repo" {
  value = aws_ecr_repository.ok_ecr.repository_url 
}

# output "cluster_arn" {
#     value       = module.ok_backend_ecs_cluster.cluster_arn
#     description = "cluster arn"
# }

# output "cluster_name" {
#     value       = module.ok_backend_ecs_cluster.cluster_name
#     description = "cluster name"
# }
