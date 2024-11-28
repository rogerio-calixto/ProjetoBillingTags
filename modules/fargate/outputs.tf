output "lb-services-arns" {
  value = module.services.lb-services-arns
}

output "lb-services-dns_names" {
  value = module.services.lb-services-dns_names
}

output "lb-tg-services-arns" {
  value = module.services.lb-tg-services-arns
}

output "ecs-task-definition-services-arns" {
  value = module.services.ecs-task-definition-services-arns
}

output "ecs-target-services" {
  value = module.services.ecs-target-services
}

output "services_list-names" {
  value = module.services.services_list-names
}

output "ecs_task_execution_role_arn" {
  value = module.base.aws_iam_role_ecs_task_execution_role_arn
}