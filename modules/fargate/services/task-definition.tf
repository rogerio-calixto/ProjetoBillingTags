resource "aws_cloudwatch_log_group" "log-group" {
  count = length(var.services-list)
  name  = "/ecs/${var.projeto}-td-${var.services-list[count.index].name}-${var.ambiente}"

  tags = {
    Servico = "${var.services-list[count.index].name}"
    # Projeto  = var.projeto
    # Ambiente = var.ambiente
  }
}

resource "aws_ecs_task_definition" "ecs-task-definition-services" {
  count                    = length(var.services-list)
  family                   = "${var.services-list[count.index].name}-td-${var.projeto}-${var.ambiente}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 2048
  task_role_arn            = var.aws-iam-role-ecs-task-role-arn
  execution_role_arn       = var.aws-iam-role-ecs-task-execution-role-arn
  container_definitions = jsonencode([{
    name      = "${var.services-list[count.index].name}-${var.projeto}-${var.ambiente}"
    image     = "${var.services-list[count.index].ecr-image}"
    
    essential = true

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"
        awslogs-group         = "${aws_cloudwatch_log_group.log-group[count.index].name}"
        awslogs-region        = "${var.regiao}"
        awslogs-stream-prefix = "ecs"
      }
    },
    environment = [
      {
        Name  = "COPYRIGHT"
        Value = "Solucoes Cloud"
      }
    ]

    portMappings = [{
      protocol      = "tcp"
      hostPort      = 80
      containerPort = 80
    }]
  }])
}