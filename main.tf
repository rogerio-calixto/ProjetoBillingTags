provider "aws" {
  region  = var.regiao
  profile = local.profile

  # default_tags {
  #   tags = {
  #     Ambiente = var.ambiente
  #     Projeto     = local.projeto
  #     Criado_Por   = local.criado_por
  #   }
  # }
}