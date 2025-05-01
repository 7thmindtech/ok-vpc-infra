resource "aws_wafregional_rule" "WAFXssRule" {
    depends_on = [aws_wafregional_xss_match_set.WAFXssDetection] # ["aws_wafregional_xss_match_set.WAFXssDetection"]
    name = "${var.env} - XSS Rule"
    metric_name = "SecurityAutomationsXssRule"
    predicate {
        data_id = "${aws_wafregional_xss_match_set.WAFXssDetection.id}"
        negated = false
        type = "XssMatch"
    }

    tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-WAFXssRule" }))
}
