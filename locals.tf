data "aws_caller_identity" "current" {}
locals {
  now          = timestamp()
  projeto      = "suporte-tags"
  tipo_criacao = "terraform"
  profile      = "tf-user"
  account-id   = data.aws_caller_identity.current.account_id
  cidr_block   = "10.0.0.0/24"
  subnet_privada_config = [
    {
      cidr_block     = "10.0.0.0/26"
      available_zone = "${var.regiao}a"
    }
  ]

  subnet_publica_config = [
    {
      cidr_block     = "10.0.0.64/26"
      available_zone = "${var.regiao}a"
    },
    {
      cidr_block     = "10.0.0.128/26"
      available_zone = "${var.regiao}b"
    }
  ]
  aws-ecr-repository-name = "projetobillingtags"
} 