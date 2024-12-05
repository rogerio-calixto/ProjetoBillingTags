resource "aws_security_group" "sg_servidor" {
  name        = "sg_servidor_${local.projeto}_${var.ambiente}"
  description = "Habilita acesso HTTP"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "sg_servidor_${local.projeto}_${var.ambiente}"
    projeto  = local.projeto
    ambiente = var.ambiente
  }
}

data "template_file" "userdata_pbt" {
  template = file("scripts/install_servidor.sh")
  vars = {
    ambiente = var.ambiente
  }
}

module "servidor" {
  source                  = "git::https://github.com/rogerio-calixto/TemplateInstance.git"
  profile                 = local.profile
  regiao                  = var.regiao
  projeto                 = local.projeto
  ambiente                = var.ambiente
  tipo_criacao            = local.tipo_criacao
  ami                     = lookup(var.amis, var.regiao)
  instance_type           = var.instance_type
  keypair_name            = var.keypair_projetobillingtags
  vpc_id                  = module.vpc.vpc_id
  subnet_id               = module.vpc.subnet_publica_ids[0]
  sg_id                   = aws_security_group.sg_servidor.id
  instance_name           = "Servidor 1"
  user_data               = data.template_file.userdata_pbt.rendered
  instance_profile_name   = aws_iam_instance_profile.ec2_profile.name
  disable_api_termination = true
  root_block_device_size  = var.root-block-device-size
}