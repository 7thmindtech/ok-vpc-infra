
resource "aws_security_group" "endpt-sg" {
  name        = "vpc_endpoint_service_security_group"
  description = "Security Group for VPC endpoint services"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-endpt-sg" }))
}


# public subnet security group

resource "aws_security_group" "pub-sub-sg" {
  name        = "public_subnet_security_group"
  description = "Security Group for public subnets"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-sub-sg" }))
}

# private subnet security group
resource "aws_security_group" "priv-sub-sg" {
  name        = "private_subnet_security_group"
  description = "Security Group for private subnets"
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    #security_groups = [data.terraform_remote_state.app_backend.outputs.alb_sg]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    #security_groups = [data.terraform_remote_state.app_backend.outputs.alb_sg]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    #security_groups = [data.terraform_remote_state.app_backend.outputs.alb_sg]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-priv-sub-sg" }))
}


# db private subnet security group 

resource "aws_security_group" "db-sub-sg" {
  name        = "database_subnet_security_group"
  description = "Security Group for database subnets"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.priv-sub-sg.id]
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.priv-sub-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-db-sub-sg" }))
}

# ECS subnet security group
resource "aws_security_group" "ecs-sub-sg" {
  name        = "ecs_private_subnet_security_group"
  description = "Security Group for ecs-private subnets"
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }  

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-ecs-priv-sub-sg" }))
}

resource "aws_security_group" "ok_alb_sg" {
  name        = "allow_all_alb"
  description = "Allow all outbound traffic"

  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-alb-sg" }))
}

resource "aws_security_group_rule" "allow_alb_https_rule" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] #modify this to allow only frontend IPs range later

  security_group_id = aws_security_group.ok_alb_sg.id

}

# Expecting traffic to go through 443 only
resource "aws_security_group_rule" "app-allow_alb_http_rule" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] #modify this to allow only frontend IPs range later

  security_group_id = aws_security_group.ok_alb_sg.id

}

resource "aws_security_group_rule" "app-allow_alb_http_rule_8080" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] #modify this to allow only frontend IPs range later

  security_group_id = aws_security_group.ok_alb_sg.id

}

resource "aws_security_group_rule" "app-allow_alb_http_rule_8443" { #modify this to allow only frontend IPs range later
  type        = "ingress"
  from_port   = 8443
  to_port     = 8443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ok_alb_sg.id

}
