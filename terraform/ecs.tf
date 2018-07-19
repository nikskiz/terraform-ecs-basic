resource "aws_launch_configuration" "energyone-dev" {
  name                 = "energyone-dev"
  image_id             = "ami-fbe9eb98"
  instance_type        = "t2.micro"
  iam_instance_profile = "ecs_role"
  security_groups      = ["${aws_security_group.ecs-dev-access.name}"]
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.energyone-dev.name} > /etc/ecs/ecs.config"
}

resource "aws_autoscaling_group" "ecs" {
  name                 = "ecs-asg"
  availability_zones   = ["ap-southeast-2a","ap-southeast-2b","ap-southeast-2c"]
  launch_configuration = "${aws_launch_configuration.energyone-dev.name}"
  min_size             = 1
  max_size             = 1
  desired_capacity     = 1
}

resource "aws_ecs_cluster" "energyone-dev" {
  name = "energyone-dev"
}
