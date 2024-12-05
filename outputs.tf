# output "lb-services-arns" {
#   description = "List ARN Load Balancer from Services"
#   value       = module.fargate.lb-services-arns
# }

# output "lb-services-dns_names" {
#   description = "List DNS_Name Load Balancer from Services"
#   value       = module.fargate.lb-services-dns_names
# }

# output "lb-tg-services-arns" {
#   description = "List ARN Target Group from Services"
#   value       = module.fargate.lb-tg-services-arns
# }

# output "ecs-task-definition-services-arns" {
#   description = "List ARN from ECS-Task-Definition from Services"
#   value       = module.fargate.ecs-task-definition-services-arns
# }

# output "ecs-target-services" {
#   description = "ECS-Target from Services"
#   value       = module.fargate.ecs-target-services
# }

# # # output "aws_api_gateway_deploy_url-usuarios" {
# # #   description = "Url Deploy / Stage - Usuarios"
# # #   value       = module.apigateway.aws_api_gateway_deploy_url-usuarios
# # # }

# # # output "aws_api_gateway_deploy_url-genericos" {
# # #   description = "Url Deploy / Stage - Genericos"
# # #   value       = module.apigateway.aws_api_gateway_deploy_url-genericos
# # # }

# # output "aws_api_gateway_deploy_url-monolith" {
# #   description = "Url Deploy / Stage - Monolith"
# #   value       = module.apigateway.aws_api_gateway_deploy_url-monolith
# # }

# output "services_ecs_task_execution_role_arn" {
#   description = "ecs_task_execution_role_arn"
#   value       = module.fargate.ecs_task_execution_role_arn
# }

# output "aws_secretsmanager_secret_settings_arn" {
#   value = module.general.aws_secretsmanager_secret_settings_arn
# }

# output "observabilidade_public_ip" {
#   description = "observabilidade_public_ip"
#   value       = module.general.observabilidade_public_ip
# }

# output "observabilidade-instance-id" {
#   value = module.general.observabilidade-instance-id
# }

# output "teste-carga-instance-id" {
#   value = module.general.teste-carga-instance-id
# }

# output "futura-sns-arn" {
#   value = module.general.futura-sns-arn
# }

output "servidor1_id" {
  value = module.servidor.ec2_instance_id
}
output "ec2_private_ip" {
  value = module.servidor.ec2_private_ip
}

output "servidor1_ip_publico" {
  value = module.servidor.ec2_public_ip
}