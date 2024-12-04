# module "fargate" {
#   source                                 = "./modules/fargate"
#   ambiente                            = var.ambiente
#   projeto                                = local.projeto
#   regiao                             = var.regiao
#   autoscale_min                          = var.autoscale_min
#   autoscale_max                          = var.autoscale_max
#   account_id                             = local.account_id
#   aws_vpc_id                             = var.vpc_id
#   public-subnet_ids                      = var.vpc_publicSubNetIds
#   prefix-list-id                         = var.prefix-list-id
#   today                                  = local.now
#   host_observabilidade                   = module.general.observabilidade_public_ip
#   aws_secretsmanager_secret_settings_arn = module.general.aws_secretsmanager_secret_settings_arn
#   sg-lb-id                               = var.sg-lb-id
#   sg-ecs-service-id                      = var.sg-ecs-service-id
#   ecstagresourcepolicyarn                = local.ecstagresourcepolicyarn
# } 