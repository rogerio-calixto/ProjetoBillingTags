provider "aws" {
  profile = local.profile

  assume_role {
    role_arn = var.arn_assumerole
  }

  # default_tags {
  #   tags = {
  #     Tipo_Criacao = local.tipo_criacao
  #     Projeto      = local.projeto
  #     Ambiente     = var.ambiente
  #   }
  # }
}