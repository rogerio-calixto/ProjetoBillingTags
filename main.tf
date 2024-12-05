provider "aws" {
  profile = local.profile

  default_tags {
    tags = {
      Ambiente = var.ambiente
      Projeto     = local.projeto
      Tipo_Criacao   = local.tipo_criacao
    }
  }
}