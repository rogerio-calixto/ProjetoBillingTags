module "base" {
  source                  = "./base"
  ambiente                = var.ambiente
  projeto                 = var.projeto
  aws-vpc-id              = var.aws-vpc-id
  account-id              = var.account-id
  regiao                  = var.regiao
  ecstagresourcepolicyarn = var.ecstagresourcepolicyarn
}
module "services" {
  source        = "./services"
  regiao        = var.regiao
  ambiente      = var.ambiente
  projeto       = var.projeto
  autoscale-min = var.autoscale-min
  autoscale-max = var.autoscale-max

  aws-iam-role-ecs-task-execution-role-id  = module.base.aws-iam-role-ecs-task-execution-role-id
  aws-iam-role-ecs-task-execution-role-arn = module.base.aws-iam-role-ecs-task-execution-role-arn
  aws-iam-role-ecs-task-role-arn           = module.base.aws-iam-role-ecs-task-role-arn
  aws-ecs-cluster-ecs-cluster-id           = module.base.aws-ecs-cluster-ecs-cluster-id
  aws-ecs-cluster-ecs-cluster-name         = module.base.aws-ecs-cluster-ecs-cluster-name
  aws-security-group-sg-lb-id              = var.sg-lb-id
  aws-security-group-sg-ecs-service-id     = var.sg-ecs-service-id

  aws-vpc-id        = var.aws-vpc-id
  public-subnet-ids = var.public-subnet-ids
  account-id        = var.account-id
  ecr-name          = var.aws-ecr-repository-name
  today             = var.today

  depends_on = [module.base]
}