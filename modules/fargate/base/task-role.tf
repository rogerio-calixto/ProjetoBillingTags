resource "aws_iam_role" "ecs-task-role" {
  name = "ecsTaskRole-${var.projeto}-${var.ambiente}"

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

resource "aws_iam_policy" "policy-ssm" {
  name = "policy-ssm-${var.projeto}-${var.ambiente}"

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

resource "aws_iam_role_policy_attachment" "ecs-task-role_policy" {
  role       = aws_iam_role.ecs-task-role.name
  policy_arn = aws_iam_policy.policy-ssm.arn
}