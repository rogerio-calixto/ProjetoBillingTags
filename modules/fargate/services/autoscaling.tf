data "aws_default_tags" "current" {}

resource "aws_appautoscaling_target" "ecs-target-services" {
  count              = length(var.services_list)
  min_capacity       = var.autoscale_min
  max_capacity       = var.autoscale_max
  resource_id        = "service/${var.aws_ecs_cluster_ecs-cluster_name}/${aws_ecs_service.ecs-services.*.name[count.index]}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  # for_each = data.aws_default_tags.current.tags
  # tags = {
  #   "${each.key}" = "${each.value}"
  # }

  tags = {
    projeto  = var.projeto
    ambiente = var.ambiente
  }

  lifecycle {
    ignore_changes = [tags]
  }

  depends_on = [
    aws_ecs_service.ecs-services
  ]
}

resource "aws_appautoscaling_policy" "ecs_policy_cpu-services" {
  count              = length(var.services_list)
  name               = "cpu-70-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs-target-services.*.resource_id[count.index]
  scalable_dimension = aws_appautoscaling_target.ecs-target-services.*.scalable_dimension[count.index]
  service_namespace  = aws_appautoscaling_target.ecs-target-services.*.service_namespace[count.index]

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
  depends_on = [aws_appautoscaling_target.ecs-target-services]
}