terraform {
  backend "s3" {
    profile = "terraform-user"
    region  = "us-east-1"
    encrypt = "true"
    bucket  = "projetobillingtags-bucket"
    key     = "terraform/state/tf_projetobillingtags.tfstate"
  }
}