# README #

### What is this repository for? ###

* A quick dev environment in AWS using Terraform and Docker for an ECS solution.
* Version 1

### Technical Decisions Made? ###

* Using Docker as it is easy for devs to move environment around
* Due to the application being small, I decided to spin up 1 ec2 instance for the ecs cluster (cost efficient)

### How To Setup and Run The Code? ###

* Ensure the following packages are installed on a linux machine
	- Docker
	- awscli (Latest Version)
	- terraform (https://www.terraform.io/intro/getting-started/install.html)
* Create a role in AWS called "ecs_role_dev" and attach the polciy "AmazonEC2ContainerServiceFullAccess" (had no time to create it with Terraform)
* In the terraform folder run `terraform init`
* bash build-dev.sh
* The Bash script will ask for details for further details

### Assumptions That Were Made ###

* Devs are familiar with docker and have local docker environments setup to be able to push their image on the aws repo.

### Future Considerations/Improvements That Can Be Made ###

* Look into SSL hostname (It is always ideal to have SSL setup on dev as you need to get this as close to production)
* Centrealize logging to cloudwatch – Makes life easier for Devs and Ops.
* If dev environment is going to replicate production, then it will need to include application level monitoring using tools such as new relic or ELK, and infrastructure monitoring with AWS
* Create a bastion host and put everything behind a ALB or a private network.
* Create a new VPC(private/public subnets, natgateway, routes ect.. ) so that the default one is not being used.
* The IaC can further divide the stack. I.E A Network stack, Web stack, DB Stack ect..
