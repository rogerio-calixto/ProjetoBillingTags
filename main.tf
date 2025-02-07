provider "aws" {
  profile = local.profile

  assume_role {
    role_arn = var.arn_assumerole
  }

  default_tags {
    tags = {
      Tipo_Criacao = local.tipo_criacao
      Prj      = local.projeto
      Env     = var.ambiente
    }
  }
}