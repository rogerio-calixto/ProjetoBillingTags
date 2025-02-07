resource "aws_alb" "lb-services" {
  count                      = length(var.services-list)
  name                       = "${var.services-list[count.index].name}-lb-${var.projeto}-${var.ambiente}"
  security_groups            = [var.aws-security-group-sg-lb-id]
  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = false
  subnets                    = var.public-subnet-ids
  idle_timeout               = var.lb-idle-timeout

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_alb_target_group" "lb-tg-services" {
  count       = length(var.services-list)
  name        = "${var.services-list[count.index].name}-tg-${var.projeto}-${var.ambiente}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = var.aws-vpc-id

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200,404"
    timeout             = "15"
    unhealthy_threshold = "2"
    path                = "/"
  }
}

resource "aws_alb_listener" "lb-listener-services" {
  count = length(var.services-list)
  default_action {
    target_group_arn = aws_alb_target_group.lb-tg-services.*.arn[count.index]
    type             = "forward"
  }

  load_balancer_arn = aws_alb.lb-services.*.arn[count.index]
  port              = 80
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.lb-tg-services]
}