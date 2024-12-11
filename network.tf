module "vpc" {
  source                = "git::https://github.com/rogerio-calixto/TemplateNetwork.git"
  profile               = local.profile
  arn_assumerole        = var.arn_assumerole
  regiao                = var.regiao
  projeto               = local.projeto
  ambiente              = var.ambiente
  tipo_criacao          = local.tipo_criacao
  cidr_block            = local.cidr_block
  subnet_privada_config = local.subnet_privada_config
  subnet_publica_config = local.subnet_publica_config
}