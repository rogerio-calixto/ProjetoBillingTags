resource "aws_ecr_repository" "microservices" {
  name                 = "${var.projeto}-microservices-${var.ambiente}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "jenkins" {
  name                 = "${var.projeto}-jenkins-${var.ambiente}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}