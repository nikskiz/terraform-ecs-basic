resource "aws_ecs_task_definition" "energyone-dev" {
  family = "energyone-dev"
  container_definitions= <<DEFINITION
[
  {
  "name": "energyone-dev",
  "cpu": 128,
  "essential": true,
  "image": "${aws_ecr_repository.energyone-dev.repository_url}:latest",
  "memory": 128,
  "memoryReservation": 64,
  "portMappings": [
          {
              "containerPort": 8080,
              "hostPort": 80,
              "protocol": "tcp"
          }
      ],
  "hostname": "e1-dev"
  }
]
DEFINITION
}

resource "aws_ecs_service" "energyone-dev" {
  name = "energyone-dev"
  cluster = "${aws_ecs_cluster.energyone-dev.id}"
  task_definition = "${aws_ecs_task_definition.energyone-dev.id}"
  desired_count = 1
}
