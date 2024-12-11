resource "aws_security_group" "sg-lb" {
  name        = "security-group-lb-${local.projeto}-${var.ambiente}"
  description = "Habilita acesso HTTP"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Efemeras"
    from_port   = 1024
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "sg-lb-${local.projeto}-${var.ambiente}"
    Projeto  = local.projeto
    Ambiente = var.ambiente
  }
}

resource "aws_security_group" "sg-ecs-service" {
  name        = "security-group-ecs-service-${local.projeto}-${var.ambiente}"
  description = "Habilita entrada ao sg-lb"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description     = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg-lb.id}"]
  }

  ingress {
    description     = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg-lb.id}"]
  }

  ingress {
    description     = "Efemeras"
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg-lb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "sg-ecs-service-${local.projeto}-${var.ambiente}"
    Projeto  = local.projeto
    Ambiente = var.ambiente
  }

  depends_on = [aws_security_group.sg-lb]
}