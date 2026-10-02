resource "aws_security_group" "alb" {
  name        = "cloudscaler-alb-sg"
  description = "Allow web traffic to ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "cloudscaler-alb-sg"
  }

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app" {
  name        = "cloudscaler-app-sg"
  description = "Allow web traffic from ALB"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "cloudscaler-app-sg"
  }

  ingress {
    description = "HTTPS from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    security_groups = [aws_security_group.alb.id]
  }
  egress {

    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

