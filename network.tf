module "vpc" {
  source                = "git::https://github.com/rogerio-calixto/TemplateNetwork.git"
  profile               = local.profile
  regiao                = var.regiao
  projeto               = local.projeto
  ambiente              = var.ambiente
  criado_por            = local.criado_por
  cidr_block            = local.cidr_block
  subnet_privada_config = local.subnet_privada_config
  subnet_publica_config = local.subnet_publica_config
}

# resource "aws_eip" "eip_nat" {
#   domain = "vpc"
#   tags = {
#     Name     = "eip_nat_${local.projeto}_${var.ambiente}"
#     projeto  = local.projeto
#     ambiente = var.ambiente
#   }
# }

# resource "aws_nat_gateway" "gateway_nat" {
#   allocation_id = aws_eip.eip_nat.id
#   subnet_id     = module.vpc.subnet_publica_ids[0]

#   tags = {
#     Name     = "nat_${local.projeto}_${var.ambiente}"
#     projeto  = local.projeto
#     ambiente = var.ambiente
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [module.vpc]
# }

# resource "aws_route_table" "rt_privada" {
#   vpc_id = module.vpc.aws_vpc_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.gateway_nat.id
#   }

#   tags = {
#     Name     = "rt_privada_${local.projeto}_${var.ambiente}"
#     projeto  = local.projeto
#     ambiente = var.ambiente
#   }

#   depends_on = [module.vpc]
# }

# resource "aws_route_table_association" "rt_association_prv" {
#   count          = length(local.subnet_privada_config)
#   route_table_id = aws_route_table.rt_privada.id
#   subnet_id      = module.vpc.subnet_privada_ids[count.index]

#   depends_on = [module.vpc]
# }