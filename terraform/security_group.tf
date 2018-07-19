resource "aws_security_group" "ecs-dev-access" {
  name        = "ecs-dev-access"
  description = "Allow inbound port 80 and all outbound connections"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${var.office-ips}"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "Allow only devs to access port 80 on the ecs cluster"
  }
}
