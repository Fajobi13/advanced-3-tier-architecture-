
# Terraform 3-Tier Architecture on AWS

This project demonstrates how to deploy a highly available 3-Tier Architecture on AWS using Terraform. The architecture includes:

	•	VPC with public, application, and database subnets across multiple Availability Zones.
	•	Application Load Balancer (ALB) for traffic distribution.
	•	Auto-scaling EC2 instances in the application tier.
	•	RDS instance in the database tier.
	•	CloudWatch Monitoring for all critical components.


### Features

	•	Fully automated infrastructure setup using Terraform.
	•	Highly available design with subnets in multiple Availability Zones.
	•	Secure architecture with separate public, application, and database layers.
	•	Monitoring via CloudWatch, including custom dashboards.
	•	Configurable parameters via terraform.tfvars.


### Modules

The project is divided into reusable modules:

	1.	VPC Module:
	•	Creates a VPC, public subnets, application subnets, and database subnets.
	•	Sets up Internet Gateway and Route Tables.
	2.	ALB Module:
	•	Creates an Application Load Balancer and Target Groups.
	3.	App Module:
	•	Deploys an Auto Scaling Group with EC2 instances.
	•	Uses a Launch Template for EC2 configuration.
	4.	DB Module:
	•	Deploys an RDS instance for the database layer.
	5.	Monitoring Module:
	•	Sets up CloudWatch dashboards and monitors key metrics for all tiers.


### Getting Started

#### Prerequisites

	1.	Terraform installed
	2.	AWS CLI installed and configured (Guide).
	3.	An AWS account with sufficient permissions to create resources.


## Setup

1. Clone the repository:

```bash
  git clone https://github.com/Fajobi13/advanced-3-tier-architecture-.git

  cd terraform-3tier-architecture
```

2.	Initialize Terraform:
```bash
  terraform init
```

3.	Edit the terraform.tfvars file to match your requirements.
4. 	Validate the configuration:

```bash
  terraform validate
```

5.	Plan the deployment:
```bash
  terraform plan
```

6.	Apply the configuration:
```bash
  terraform apply
```
