provider "aws" {
  profile = local.profile

  assume_role {
    role_arn = var.arn_assumerole
  }

  # default_tags {
  #   tags = {
  #     Ambiente     = "Ambiente_Demonstracao"
  #     Projeto      = "Projeto_Demonstracao"
  #     Tipo_Criacao = "Tipo_Demonstracao"
  #   }
  # }

  # default_tags {
  #   tags = {
  #     Ambiente     = var.ambiente
  #     Projeto      = local.projeto
  #     Tipo_Criacao = local.tipo_criacao
  #   }
  # }
}