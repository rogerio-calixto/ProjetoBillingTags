module "fargate" {
  source                  = "./modules/fargate"
  ambiente                = var.ambiente
  projeto                 = local.projeto
  regiao                  = var.regiao
  autoscale-min           = var.autoscale-min
  autoscale-max           = var.autoscale-max
  account-id              = local.account-id
  aws-vpc-id              = module.vpc.vpc_id
  public-subnet-ids       = module.vpc.subnet_publica_ids
  today                   = local.now
  sg-lb-id                = aws_security_group.sg-lb.id
  sg-ecs-service-id       = aws_security_group.sg-ecs-service.id
  # ecstagresourcepolicyarn = aws_iam_policy.ecstagresource-policy.arn
  ecstagresourcepolicyarn = ""
  aws-ecr-repository-name = local.aws-ecr-repository-name
} 