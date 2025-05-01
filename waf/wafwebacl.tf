resource "aws_wafregional_web_acl" "WAFWebACL" {
    depends_on = [aws_wafregional_rule.WAFWhitelistRule, aws_wafregional_rule.WAFSqlInjectionRule, aws_wafregional_rule.WAFXssRule] # ["aws_wafregional_rule.WAFWhitelistRule", "aws_wafregional_rule.WAFSqlInjectionRule", "aws_wafregional_rule.WAFXssRule"]
    name = "${var.env}-WafWebACL"
    metric_name = "SecurityAutomationsMaliciousRequesters"
    default_action {
        type = "ALLOW"
    }
    rule {
        action {
            type = "ALLOW"
        }
        priority = 10
        rule_id = "${aws_wafregional_rule.WAFWhitelistRule.id}"
    }
    rule {
        action {
            type = "BLOCK"
        }
        priority = 70
        rule_id = "${aws_wafregional_rule.WAFSqlInjectionRule.id}"
    }
    rule {
        action {
            type = "BLOCK"
        }
        priority = 80
        rule_id = "${aws_wafregional_rule.WAFXssRule.id}"
    }

    /*rules {
        action {
            type = "BLOCK"
        }
        priority = 20
        rule_id = "${aws_waf_rule.WAFBlacklistRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 30
        rule_id = "${aws_waf_rule.WAFAutoBlockRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 40
        rule_id = "${aws_waf_rule.WAFIPReputationListsRule1.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 50
        rule_id = "${aws_waf_rule.WAFIPReputationListsRule2.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 60
        rule_id = "${aws_waf_rule.WAFBadBotRule.id}"
    }*/

    tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-WAFWebACL" }))
 }