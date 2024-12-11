resource "aws_iam_policy" "ec2_s3_policy" {
  name        = "EC2_Acessar_S3_Policy"
  path        = "/"
  description = "permissoes de acesso S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*",
          "s3:Put*"
        ],
        "Resource" : "*",
      }
    ]
  })
}

resource "aws_iam_role" "servidor_role" {
  name = "Servidor_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2-s3-policy-attach" {
  role       = aws_iam_role.servidor_role.name
  policy_arn = aws_iam_policy.ec2_s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "Servidor_Role_Profile_${local.projeto}-${var.ambiente}"
  role = aws_iam_role.servidor_role.name
}

# resource "aws_iam_policy" "ecstagresource-policy" {
#   name        = "ecstagresource-policy"
#   path        = "/"
#   description = "permissoes para tags em ecs"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         "Sid" : "VisualEditor0",
#         "Effect" : "Allow",
#         "Action" : [
#           "ecs:TagResource"
#         ],
#         "Resource" : "*",
#       }
#     ]
#   })
# }