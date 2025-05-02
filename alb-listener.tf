resource "aws_lb_listener" "alb-listner_80" {
  load_balancer_arn = aws_lb.ok-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.ok-ecomm-tg.arn
  }

  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-ecomm-listner-80" }))
}

# Change to https when certificate is available
# resource "aws_lb_listener" "alb-listner_443" {
#   load_balancer_arn = aws_lb.ok-alb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ok-ecomm-tg.arn
#   }

#   certificate_arn = aws_acm_certificate.ok-cert.arn

#   tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-ecomm-listner-443" }))
# }