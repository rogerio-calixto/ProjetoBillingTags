variable "ambiente" {
  type        = string
  description = "ambiente para o recurso"
  default     = "dev"
}

variable "regiao" {
  type        = string
  description = "regiao onde sera criado o recurso"
  default     = "us-east-1"
}

variable "regiao_names" {
  description = "regioes disponíveis"
  default = {
    us-east-1 = "virginia"
    us-east-2 = "ohio"
    us-west-1 = "california"
    us-west-2 = "oregon"
  }
}

variable "amis" {
  description = "imagens disponíveis"
  default = {
    us-east-1 = "ami-0e2c8caa4b6378d8c"
    us-east-2 = "ami-036841078a4b68e14"
    us-west-1 = "ami-0657605d763ac72a8"
    us-west-2 = "ami-05d38da78ce859165"
  }
}

variable "autoscale-min" {
  default     = "1"
  description = "mínimo de servidores levantados pelo autoscale"
}

variable "autoscale-max" {
  default     = "4"
  description = "máximo de servidores levantados por autoscale"
}

variable "keypair_projetobillingtags" {
  default     = "projetobillingtags"
  description = "par de chaves para acesso de instâncias"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "tipo da instância"
}

variable "root-block-device-size" {
  type        = any
  description = "tamanho do volume EBS"
  default     = 10
}

variable "arn_assumerole" {
  type = string
}