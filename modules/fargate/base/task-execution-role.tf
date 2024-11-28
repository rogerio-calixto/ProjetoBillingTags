resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.projeto}-ecsTaskExecutionRole-${var.ambiente}"

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

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  depends_on = [
    aws_iam_role.ecs_task_execution_role
  ]
}

resource "aws_iam_role_policy_attachment" "ecs_tagresource_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = var.ecstagresourcepolicyarn
}

# resource "aws_iam_role_policy_attachment" "ecs_secrets_task_execution_role_policy" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = aws_iam_policy.policy_secrets.arn
# }