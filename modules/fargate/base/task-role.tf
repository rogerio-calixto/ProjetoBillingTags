resource "aws_iam_role" "ecs_task_role" {
  name = "${var.projeto}-ecsTaskRole-${var.ambiente}"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_policy" "policy_ssm" {
  name = "${var.projeto}-policy-ssm-${var.ambiente}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policy" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.policy_ssm.arn
}

# resource "aws_iam_role_policy_attachment" "ecs_secrets_task_role_policy" {
#   role       = aws_iam_role.ecs_task_role.name
#   policy_arn = aws_iam_policy.policy_secrets.arn
# }