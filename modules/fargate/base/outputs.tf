output "aws-iam-role-ecs-task-role-arn" {
  value = aws_iam_role.ecs-task-role.arn
}

output "aws-iam-role-ecs-task-execution-role-arn" {
  value = aws_iam_role.ecs-task-execution-role.arn
}

output "aws-iam-role-ecs-task-execution-role-id" {
  value = aws_iam_role.ecs-task-execution-role.id
}

output "aws-ecs-cluster-ecs-cluster-id" {
  value = aws_ecs_cluster.ecs-cluster.id
}

output "aws-ecs-cluster-ecs-cluster-name" {
  value = aws_ecs_cluster.ecs-cluster.name
}