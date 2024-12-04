terraform {
  backend "s3" {
    bucket  = "projetobillingtags-bucket"
    encrypt = "true"
    region  = "us-east-1"
  }
}