# # Secrets
# resource "aws_iam_policy" "policy_secrets" {
#   name = "${var.projeto}-policy-secrets-${var.ambiente}"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#             "secretsmanager:*"
#         ]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }