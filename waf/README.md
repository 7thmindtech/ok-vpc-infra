#AWS WAF Security Automations

A solution that contains all AWS WAF samples developed so far - waf-reactive-blacklist, waf-bad-bot-blocking, waf-block-bad-behaving and waf-reputation-lists.

For the full solution overview visit AWS WAF Security Automations, https://aws.amazon.com/solutions/aws-waf-security-automations/

##Calling the module

module "waf" {
  source = "waf-module/waf"  #Specicy your source 
  project_name = "the-project-name"
  CloudFrontAccessLogBucket = "name-of-the-cloudfront-access-log-bucket"
  env = "name-of-the-environment eg dev/test/pre-prod/staging/prod"
}
