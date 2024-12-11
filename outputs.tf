output "lb-services-arns" {
  description = "List ARN Load Balancer from Services"
  value       = module.fargate.lb-services-arns
}

output "lb-services-dns-names" {
  description = "List DNS_Name Load Balancer from Services"
  value       = module.fargate.lb-services-dns-names
}

output "lb-tg-services-arns" {
  description = "List ARN Target Group from Services"
  value       = module.fargate.lb-tg-services-arns
}

output "ecs-task-definition-services-arns" {
  description = "List ARN from ECS-Task-Definition from Services"
  value       = module.fargate.ecs-task-definition-services-arns
}

output "ecs-target-services" {
  description = "ECS-Target from Services"
  value       = module.fargate.ecs-target-services
}

output "services_ecs-task-execution-role_arn" {
  description = "ecs-task-execution-role_arn"
  value       = module.fargate.ecs-task-execution-role_arn
}

output "servidor1_id" {
  value = module.servidor.ec2_instance_id
}
output "ec2_private_ip" {
  value = module.servidor.ec2_private_ip
}

output "servidor1_ip_publico" {
  value = module.servidor.ec2_public_ip
}