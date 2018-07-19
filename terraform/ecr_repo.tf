resource "aws_ecr_repository" "energyone-dev" {
  name = "energyone-dev"
}
resource "aws_ecr_repository_policy" "energyone-dev-policy" {
  repository = "${aws_ecr_repository.energyone-dev.name}"
  policy = <<EOF
{
	"Version": "2008-10-17",
	 "Statement": [
		{
			"Sid": "new policy",
			"Effect": "Allow",
			"Principal": {
				"AWS": [
					"arn:aws:iam::${var.aws_userid}:role/ecs_role"
				]
			},
			"Action": [
				"ecr:GetDownloadUrlForLayer",
				"ecr:BatchGetImage",
				"ecr:BatchCheckLayerAvailability"
			]
		}
	]
}
EOF
}
				

