output "lb-services-arns" {
  value = aws_alb.lb-services.*.arn
}

output "lb-services-dns_names" {
  value = aws_alb.lb-services.*.dns_name
}

output "lb-tg-services-arns" {
  value = aws_alb_target_group.lb-tg-services.*.arn
}

output "ecs-task-definition-services-arns" {
  value = aws_ecs_task_definition.ecs-task-definition-services.*.arn
}

output "ecs-target-services" {
  value = aws_appautoscaling_target.ecs-target-services
}

output "services_list-names" {
  value = var.services_list.*.name
}