resource "aws_lb_target_group" "ok-ecomm-tg" {
  name        = "${var.cust_name}-ecomm-${var.env}-tg"
  port        = 80
  protocol    = "HTTP" # Change to HTTPS when certificate is available
  target_type = "ip"
  vpc_id      = aws_vpc.main.id

health_check {
    path                = "/docs"
    port                = "8000"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    interval            = 240
    timeout             = 120
    matcher             = "200"
  }
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-ecomm-${var.env}-tg" }))

}
