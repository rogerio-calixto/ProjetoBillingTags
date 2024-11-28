terraform {
  backend "s3" {
    profile = "pbt_user"
    bucket  = "solucoes_cloud_infraestrutura"
    encrypt = "true"
    region  = "us-east-1"
  }
}