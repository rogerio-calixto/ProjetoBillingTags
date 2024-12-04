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
    us-east-1 = "ami-0a6b2839d44d781b2"
    us-east-2 = "ami-0ada6d94f396377f2"
    us-west-1 = "ami-0f4feb99425e13b50"
    us-west-2 = "ami-0530ca8899fac469f"
  }
}

variable "autoscale_min" {
  default     = "1"
  description = "mínimo de servidores levantados pelo autoscale"
}

variable "autoscale_max" {
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

variable "assume_role_arn" {
  type    = string
  default = ""
}