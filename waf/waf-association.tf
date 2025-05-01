resource "aws_wafregional_web_acl_association" "app-alb" {
  resource_arn = var.app_alb_arn
  web_acl_id   = aws_wafregional_web_acl.WAFWebACL.id
}
