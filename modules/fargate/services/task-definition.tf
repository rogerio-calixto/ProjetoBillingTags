resource "aws_cloudwatch_log_group" "log_group" {
  count = length(var.services_list)
  name  = "/ecs/${var.projeto}-td-${var.services_list[count.index].name}-${var.ambiente}"

  tags = {
    projeto     = var.projeto
    ambiente = var.ambiente
  }
}

resource "aws_ecs_task_definition" "ecs-task-definition-services" {
  count                    = length(var.services_list)
  family                   = "${var.projeto}-td-${var.services_list[count.index].name}-${var.ambiente}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 2048
  task_role_arn            = var.aws_iam_role_ecs_task_role_arn
  execution_role_arn       = var.aws_iam_role_ecs_task_execution_role_arn
  container_definitions = jsonencode([{
    name      = "${var.projeto}-${var.services_list[count.index].name}-${var.ambiente}"
    image     = "${var.account_id}.dkr.ecr.${var.regiao}.amazonaws.com/${var.ecr_name}:${var.services_list[count.index].name}-v00"
    essential = true

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"
        awslogs-group         = "${aws_cloudwatch_log_group.log_group[count.index].name}"
        awslogs-region        = "${var.regiao}"
        awslogs-stream-prefix = "ecs"
      }
    },
    ambiente = [
      {
        Name  = "OTEL_SERVICE_NAME"
        Value = "Monolith"
      },
      {
        Name  = "OTEL_EXPORTER_OTLP_ENDPOINT"
        Value = "http://${var.host_observabilidade}:4318"
      },
      {
        Name  = "OTEL_DOTNET_AUTO_TRACES_ADDITIONAL_SOURCES"
        Value = ""
      },
      {
        Name  = "OTEL_DOTNET_AUTO_METRICS_ADDITIONAL_SOURCES"
        Value = ""
      },
      {
        Name  = "OTEL_DOTNET_AUTO_LOGS_CONSOLE_EXPORTER_ENABLED"
        Value = "false"
      },
      {
        Name  = "OTEL_DOTNET_AUTO_METRICS_CONSOLE_EXPORTER_ENABLED"
        Value = "false"
      },
      {
        Name  = "OTEL_DOTNET_AUTO_TRACES_CONSOLE_EXPORTER_ENABLED"
        Value = "false"
      },
      {
        Name  = "CORECLR_ENABLE_PROFILING"
        Value = "1"
      },
      {
        Name  = "CORECLR_PROFILER"
        Value = "{918728DD-259F-4A6A-AC2B-B85E1B658318}"
      },
      {
        Name  = "CORECLR_PROFILER_PATH"
        Value = "/otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so"
      },
      {
        Name  = "DOTNET_ADDITIONAL_DEPS"
        Value = "/otel-dotnet-auto/AdditionalDeps"
      },
      {
        Name  = "DOTNET_SHARED_STORE"
        Value = "/otel-dotnet-auto/store"
      },
      {
        Name  = "DOTNET_STARTUP_HOOKS"
        Value = "/otel-dotnet-auto/net/OpenTelemetry.AutoInstrumentation.StartupHook.dll"
      },
      {
        Name  = "OTEL_DOTNET_AUTO_HOME"
        Value = "/otel-dotnet-auto"
      },
      {
        Name  = "OTEL_DOTNET_AUTO_INTEGRATIONS_FILE"
        Value = "/otel-dotnet-auto/integrations.json"
      },
      {
        Name  = "COPYRIGHT"
        Value = "Futura Sistemas"
      }
    ]

    # dockerLabels = {
    #    logging =  "promtail",
    #    logging_jobname =  "containerlogs"
    # }

    portMappings = [{
      protocol      = "tcp"
      hostPort      = 80
      containerPort = 80
    }]
  }])
}

# resource "aws_iam_role_policy" "test_policy" {
#   name = "secretaccess-${var.ambiente}"
#   role = var.aws_iam_role_ecs_task_execution_role_id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#           "secretsmanager:GetSecretValue",
#         ]
#         Effect   = "Allow"
#         Resource = "${var.aws_secretsmanager_secret_settings_arn}"
#       },
#     ]
#   })
# }