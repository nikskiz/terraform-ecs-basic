# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* This is the Energy One solution for a quick dev environment on AWS using Terraform and Docker.
* Version 1

### Technical Decisions Made? ###

* Using Docker as it is easy for devs to move environment around
* Due to the application being small, I decided to spin up 1 ec2 instance for the ecs cluster (cost efficient)

### How To Setup and Run The Code? ###

* Ensure the following packages are installed on a linux machine
	- Docker
	- awscli (Latest Version)
	- terraform (https://www.terraform.io/intro/getting-started/install.html)
* Create a role in AWS called "ecs_role" and attach the polciy "AmazonEC2ContainerServiceFullAccess" (had no time to create it with Terraform)
* git clone https://nikskiz@bitbucket.org/nikskiz/energy-one-infra-problem.git
* in the terraform folder run `terraform init`
* bash build-dev.sh
* The Bash script will ask for details for further details

### Assumptions That Were Made ###

* Devs are familiar with docker and have local docker environments setup to be able to push their image on the aws repo.

### Future Considerations/Improvements That Can Be Made ###

* Look into SSL hostname (It is always ideal to have SSL setup on dev as you need to get this as close to production)
* Centrealize logging to cloudwatch – Makes life easier for Devs and Dev Ops.
* If dev environment is going to replicate production, then it will need to include application level monitoring using tools such as new relic, and infrastructure monitoring with AWS
* I would also suggest using a resin or resin pro to run if the application would become bigger.
* Create a bastion host and put everything behind a ALB or a private network, this way SSH can be enabled for debuging.
* Create a new VPC(private/public subnets, natgateway, routes ect.. ) so that the default one is not being used (Recommended by AWS)
* Use the ECS solution for Production, so creating a dev and prod branch for the IaC. Devops can make tests on Dev and and then push it to production.
* The IaC will divided in two. A Network stack and a Web stack (posibly more stacks included depending on the future growth of the APP, I.E Does it require a DB?)
