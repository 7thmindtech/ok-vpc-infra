resource "aws_wafregional_sql_injection_match_set" "WAFSqlInjectionDetection" {
    name  = "${var.env} - SQL Injection Detection"
    sql_injection_match_tuple {
        text_transformation = "URL_DECODE"
        field_to_match {
          type = "QUERY_STRING"
          data = "none"
        }
    }
    sql_injection_match_tuple {
        text_transformation = "HTML_ENTITY_DECODE"
        field_to_match {
          type = "QUERY_STRING"
          data = "none"
        }
    }
    sql_injection_match_tuple {
        text_transformation = "URL_DECODE"
        field_to_match {
          type = "BODY"
          data = "none"
        }
    }
    sql_injection_match_tuple {
        text_transformation = "HTML_ENTITY_DECODE"
        field_to_match {
          type = "BODY"
          data = "none"
        }
    }
    sql_injection_match_tuple {
        text_transformation = "URL_DECODE"
        field_to_match {
          type = "URI"
          data = "none"
        }
    }
    sql_injection_match_tuple {
        text_transformation = "HTML_ENTITY_DECODE"
        field_to_match {
          type = "URI"
          data = "none"
        }
    }
}

