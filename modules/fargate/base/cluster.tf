resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.projeto}-cluster-${var.ambiente}"

  tags = {
    Name        = "${var.projeto}-cluster-${var.ambiente}"
    projeto     = var.projeto
    ambiente = var.ambiente
    Automacao   = "enabled"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}