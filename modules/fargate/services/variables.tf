variable "ambiente" {}
variable "regiao" {}
variable "projeto" {}
variable "autoscale_min" {}
variable "autoscale_max" {}
variable "aws_iam_role_ecs_task_execution_role_arn" {}
variable "aws_iam_role_ecs_task_role_arn" {}
variable "aws_ecs_cluster_ecs-cluster_id" {}
variable "aws_ecs_cluster_ecs-cluster_name" {}
variable "aws_security_group_sg-lb_id" {}
variable "aws_security_group_sg-ecs-service_id" {}
variable "aws_vpc_id" {}
variable "public-subnet_ids" {}
variable "ecr_name" {}
variable "account_id" {}
variable "today" {}
variable "host_observabilidade" {}
variable "aws_secretsmanager_secret_settings_arn" {}
variable "aws_iam_role_ecs_task_execution_role_id" {}
variable "lb-idle-timeout" {
  description = "Tempo em segundos antes de executar Timeout de requisição no LB"
  default     = 900
}

variable "services_list" {
  type = list(object({
    name      = string
    ecr-image = string
  }))
  description = "List of all services"
  default = [
    {
      name      = "monolith"
      ecr-image = ""
    }
  ]
}