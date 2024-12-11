resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.projeto}-cluster-${var.ambiente}"

  tags = {
    Name      = "cluster-${var.projeto}-${var.ambiente}"
    Projeto   = var.projeto
    Ambiente  = var.ambiente
    Automacao = "enabled"
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}