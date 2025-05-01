resource "aws_wafregional_rule" "WAFWhitelistRule" {
    depends_on = [aws_wafregional_ipset.WAFWhitelistSet] # ["aws_wafregional_ipset.WAFWhitelistSet"]
    name = "${var.env} - Whitelist Rule"
    metric_name = "SecurityAutomationsWhitelistRule"
    predicate {
        data_id = "${aws_wafregional_ipset.WAFWhitelistSet.id}"
        type = "IPMatch"
        negated = false
    }

    tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-WAFWhitelistRule" }))
}
