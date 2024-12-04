module "base" {
  source                  = "./base"
  ambiente                = var.ambiente
  projeto                 = var.projeto
  aws_vpc_id              = var.aws_vpc_id
  prefix-list-id          = var.prefix-list-id
  account_id              = var.account_id
  regiao                  = var.regiao
  ecstagresourcepolicyarn = var.ecstagresourcepolicyarn
}
module "services" {
  source        = "./services"
  regiao        = var.regiao
  ambiente      = var.ambiente
  projeto       = var.projeto
  autoscale_min = var.autoscale_min
  autoscale_max = var.autoscale_max

  aws_iam_role_ecs_task_execution_role_id  = module.base.aws_iam_role_ecs_task_execution_role_id
  aws_iam_role_ecs_task_execution_role_arn = module.base.aws_iam_role_ecs_task_execution_role_arn
  aws_iam_role_ecs_task_role_arn           = module.base.aws_iam_role_ecs_task_role_arn
  aws_ecs_cluster_ecs-cluster_id           = module.base.aws_ecs_cluster_ecs-cluster_id
  aws_ecs_cluster_ecs-cluster_name         = module.base.aws_ecs_cluster_ecs-cluster_name
  aws_security_group_sg-lb_id              = var.sg-lb-id
  aws_security_group_sg-ecs-service_id     = var.sg-ecs-service-id

  aws_vpc_id                             = var.aws_vpc_id
  public-subnet_ids                      = var.public-subnet_ids
  account_id                             = var.account_id
  ecr_name                               = aws_ecr_repository.microservices.name
  today                                  = var.today
  host_observabilidade                   = var.host_observabilidade
  aws_secretsmanager_secret_settings_arn = var.aws_secretsmanager_secret_settings_arn

  depends_on = [module.base]
}