output "aws_iam_role_ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "aws_iam_role_ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "aws_iam_role_ecs_task_execution_role_id" {
  value = aws_iam_role.ecs_task_execution_role.id
}

output "aws_ecs_cluster_ecs-cluster_id" {
  value = aws_ecs_cluster.ecs-cluster.id
}

output "aws_ecs_cluster_ecs-cluster_name" {
  value = aws_ecs_cluster.ecs-cluster.name
}