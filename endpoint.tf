resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${var.region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3a" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.priv_route_tab.id
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpt-sg.id,
  ]

  private_dns_enabled = "true"
}

resource "aws_vpc_endpoint_subnet_association" "ssma" {
  vpc_endpoint_id = aws_vpc_endpoint.ssm.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 1)
}

resource "aws_vpc_endpoint_subnet_association" "ssmb" {
  vpc_endpoint_id = aws_vpc_endpoint.ssm.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 2)
}

resource "aws_vpc_endpoint_subnet_association" "ssmc" {
  vpc_endpoint_id = aws_vpc_endpoint.ssm.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 3)
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpt-sg.id,
  ]

  private_dns_enabled = "true"
}

resource "aws_vpc_endpoint_subnet_association" "ssmma" {
  vpc_endpoint_id = aws_vpc_endpoint.ssmmessages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 1)
}

resource "aws_vpc_endpoint_subnet_association" "ssmmb" {
  vpc_endpoint_id = aws_vpc_endpoint.ssmmessages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 2)
}

resource "aws_vpc_endpoint_subnet_association" "ssmmc" {
  vpc_endpoint_id = aws_vpc_endpoint.ssmmessages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 3)
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpt-sg.id,
  ]

  private_dns_enabled = "true"
}

resource "aws_vpc_endpoint_subnet_association" "ec2msga" {
  vpc_endpoint_id = aws_vpc_endpoint.ec2messages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 1)
}

resource "aws_vpc_endpoint_subnet_association" "ec2msgb" {
  vpc_endpoint_id = aws_vpc_endpoint.ec2messages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 2)
}

resource "aws_vpc_endpoint_subnet_association" "ec2msgc" {
  vpc_endpoint_id = aws_vpc_endpoint.ec2messages.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 3)
}

resource "aws_vpc_endpoint" "cwlog" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpt-sg.id,
  ]

  private_dns_enabled = "true"
}

resource "aws_vpc_endpoint_subnet_association" "cwloga" {
  vpc_endpoint_id = aws_vpc_endpoint.cwlog.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 1)
}

resource "aws_vpc_endpoint_subnet_association" "cwlogb" {
  vpc_endpoint_id = aws_vpc_endpoint.cwlog.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 2)
}

resource "aws_vpc_endpoint_subnet_association" "cwlogc" {
  vpc_endpoint_id = aws_vpc_endpoint.cwlog.id
  subnet_id       = element(aws_subnet.app_priv_subnet.*.id, 3)
}