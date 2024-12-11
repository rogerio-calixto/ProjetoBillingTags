resource "aws_iam_role" "ecs-task-execution-role" {
  name = "ecsTaskExecutionRole-${var.projeto}-${var.ambiente}"

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
  role       = aws_iam_role.ecs-task-execution-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  depends_on = [
    aws_iam_role.ecs-task-execution-role
  ]
}

# resource "aws_iam_role_policy_attachment" "ecs-tagresource-task-execution-role-policy" {
#   role       = aws_iam_role.ecs-task-execution-role.name
#   policy_arn = var.ecstagresourcepolicyarn
# }