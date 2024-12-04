provider "aws" {
  region = var.regiao

  assume_role {
    role_arn = var.assume_role_arn
  }

  # profile = local.profile

  # default_tags {
  #   tags = {
  #     Ambiente = var.ambiente
  #     Projeto     = local.projeto
  #     Criado_Por   = local.criado_por
  #   }
  # }
}