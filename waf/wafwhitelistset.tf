resource "aws_wafregional_ipset" "WAFWhitelistSet" {
    name = "${var.env} - Whitelist Set"
    ip_set_descriptor {
        type = "IPV4"
        value = "0.0.0.0/32"
    }
}
