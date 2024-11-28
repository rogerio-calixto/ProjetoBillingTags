resource "aws_alb" "lb-services" {
  count                      = length(var.services_list)
  name                       = "${var.projeto}-lb-${var.services_list[count.index].name}-${var.ambiente}"
  security_groups            = [var.aws_security_group_sg-lb_id]
  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = false
  subnets                    = var.public-subnet_ids
  idle_timeout               = var.lb-idle-timeout
}

resource "aws_alb_target_group" "lb-tg-services" {
  count       = length(var.services_list)
  name        = "${var.projeto}-tg-${var.services_list[count.index].name}-${var.ambiente}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = var.aws_vpc_id

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
  count = length(var.services_list)
  default_action {
    target_group_arn = aws_alb_target_group.lb-tg-services.*.arn[count.index]
    type             = "forward"
  }

  load_balancer_arn = aws_alb.lb-services.*.arn[count.index]
  port              = 80
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.lb-tg-services]
}