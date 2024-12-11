output "lb-services-arns" {
  value = module.services.lb-services-arns
}

output "lb-services-dns-names" {
  value = module.services.lb-services-dns-names
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

output "services-list-names" {
  value = module.services.services-list-names
}

output "ecs-task-execution-role_arn" {
  value = module.base.aws-iam-role-ecs-task-execution-role-arn
}