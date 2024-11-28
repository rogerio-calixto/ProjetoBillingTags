data "aws_caller_identity" "current" {}
locals {
  now                     = timestamp()
  projeto                 = "billing_tags"
  criado_por               = "terraform"
  profile             = "pbt_user"
  account_id              = data.aws_caller_identity.current.account_id
  cidr_block = "10.0.0.0/16"
  subnet_privada_config = [
    {
      cidr_block     = "10.0.1.0/24"
      available_zone = "${var.regiao}a"
    }
  ]

  subnet_publica_config = [
    {
      cidr_block     = "10.0.8.0/24"
      available_zone = "${var.regiao}a"
    }
  ]
  ecstagresourcepolicyarn = "arn:aws:iam::791659331772:policy/pbt-ecstagresource-policy"
} 