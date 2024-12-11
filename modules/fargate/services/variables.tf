variable "ambiente" {}
variable "regiao" {}
variable "projeto" {}
variable "autoscale-min" {}
variable "autoscale-max" {}
variable "aws-iam-role-ecs-task-execution-role-arn" {}
variable "aws-iam-role-ecs-task-role-arn" {}
variable "aws-ecs-cluster-ecs-cluster-id" {}
variable "aws-ecs-cluster-ecs-cluster-name" {}
variable "aws-security-group-sg-lb-id" {}
variable "aws-security-group-sg-ecs-service-id" {}
variable "aws-vpc-id" {}
variable "public-subnet-ids" {}
variable "ecr-name" {}
variable "account-id" {}
variable "today" {}
variable "aws-iam-role-ecs-task-execution-role-id" {}
variable "lb-idle-timeout" {
  description = "Tempo em segundos antes de executar Timeout de requisição no LB"
  default     = 60
}

variable "services-list" {
  type = list(object({
    name      = string
    ecr-image = string
  }))
  description = "List of all services"
  default = [
    {
      name      = "website"
      ecr-image = "365857435132.dkr.ecr.us-east-1.amazonaws.com/projetobillingtags:img_fargate_v1"
    }
  ]
}