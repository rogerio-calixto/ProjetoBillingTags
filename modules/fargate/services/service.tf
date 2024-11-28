resource "aws_ecs_service" "ecs-services" {
  count                              = length(var.services_list)
  name                               = "${var.projeto}-srv-${var.services_list[count.index].name}-${var.ambiente}"
  cluster                            = var.aws_ecs_cluster_ecs-cluster_id
  task_definition                    = aws_ecs_task_definition.ecs-task-definition-services.*.arn[count.index]
  desired_count                      = 0
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  enable_execute_command             = true
  health_check_grace_period_seconds  = 180
  propagate_tags                     = "SERVICE"

  network_configuration {
    security_groups  = [var.aws_security_group_sg-ecs-service_id]
    subnets          = var.public-subnet_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.lb-tg-services.*.arn[count.index]
    container_name   = "${var.projeto}-${var.services_list[count.index].name}-${var.ambiente}"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on = [
    aws_alb_target_group.lb-tg-services
  ]
}