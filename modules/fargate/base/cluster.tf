resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.projeto}-cluster-${var.ambiente}"

  tags = {
    Name      = "cluster-${var.projeto}-${var.ambiente}"
    Automacao = "enabled"
    Prj   = "suporte-tags"
    Env  = "admin"
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}