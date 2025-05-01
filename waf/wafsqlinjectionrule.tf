resource "aws_wafregional_rule" "WAFSqlInjectionRule" {
    depends_on = [aws_wafregional_sql_injection_match_set.WAFSqlInjectionDetection] # ["aws_wafregional_sql_injection_match_set.WAFSqlInjectionDetection"]
    name = "${var.env} - SQL Injection Rule"
    metric_name = "SecurityAutomationsSqlInjectionRule"
    predicate {
        data_id = "${aws_wafregional_sql_injection_match_set.WAFSqlInjectionDetection.id}"
        negated = false
        type = "SqlInjectionMatch"
      }

    tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-WAFSqlInjectionRule" }))
}
