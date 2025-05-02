
resource "aws_lb" "ok-alb" {
  name     = "${var.cust_name}-alb"
  internal = false

  security_groups = [
    aws_security_group.ok_alb_sg.id,
  ]

  subnets = aws_subnet.public_subnet[*].id
  idle_timeout = 120

  ip_address_type    = "ipv4"
  load_balancer_type = "application"

  access_logs {
    bucket = aws_s3_bucket.ok-backup.id
    prefix = "alb"
    enabled = true
  }
  enable_deletion_protection = false

  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-alb" }))
}
