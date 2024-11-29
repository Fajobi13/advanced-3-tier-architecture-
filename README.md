
# Terraform 3-Tier Architecture on AWS

This project demonstrates how to deploy a highly available 3-Tier Architecture on AWS using Terraform. The architecture includes:

 • VPC with public, application, and database subnets across multiple Availability Zones.
 • Application Load Balancer (ALB) for traffic distribution.
 • Auto-scaling EC2 instances in the application tier.
 • RDS instance in the database tier.
 • CloudWatch Monitoring for all critical components.

### Features

 • Fully automated infrastructure setup using Terraform.
 • Highly available design with subnets in multiple Availability Zones.
 • Secure architecture with separate public, application, and database layers.
 • Monitoring via CloudWatch, including custom dashboards.
 • Configurable parameters via terraform.tfvars.

### Modules

The project is divided into reusable modules:

 1. VPC Module:
 • Creates a VPC, public subnets, application subnets, and database subnets.
 • Sets up Internet Gateway and Route Tables.
 2. ALB Module:
 • Creates an Application Load Balancer and Target Groups.
 3. App Module:
 • Deploys an Auto Scaling Group with EC2 instances.
 • Uses a Launch Template for EC2 configuration.
 4. DB Module:
 • Deploys an RDS instance for the database layer.
 5. Monitoring Module:
 • Sets up CloudWatch dashboards and monitors key metrics for all tiers.

### Getting Started

#### Prerequisites

 1. Terraform installed
 2. AWS CLI installed and configured
 3. An AWS account with sufficient permissions to create resources.

## Setup

1. Clone the repository:

```bash
  git clone https://github.com/Fajobi13/advanced-3-tier-architecture-.git

  cd terraform-3tier-architecture
```

2. Initialize Terraform:

```bash
  terraform init
```

3. Edit the terraform.tfvars file to match your requirements.
4.  Validate the configuration:

```bash
  terraform validate
```

5. Plan the deployment:

```bash
  terraform plan
```

6. Apply the configuration:

```bash
  terraform apply
```

### Inputs

The key inputs for this project are defined in variables.tf. Below are the most important parameters:

| Variable | Description                | Default Value |
| :-------- | :------------------------- | :-------- |
| `cidr_block` | CIDR block for the VPC | `eu-west-2` |
| `default_tags` | Default tags for resources | `10.0.0.0/16` |
| `public_subnet_cidrs` | Default tags for resources | {subnet-1,subnet-2} |
| `app_subnet_cidrs` | Default tags for resources | {subnet-1,subnet-2} |
| `db_subnet_cidrs` | Default tags for resources | {subnet-1,subnet-2} |
| `ami_id` | AMI ID for EC2 instances | `ami-0c02fb55956c7d316` |
| `instance_type` | Instance type for EC2 instances | `t2.micro16` |
| `db_credentials` | Database username and password | {"username": "admin", "password": "secure_password"} |

### Outputs

After deployment, the following outputs are available:

| Output Name | Description                |
| :-------- | :------------------------- |
| `vpc_id` | ID of the created VPC |
| `public_subnet_ids` | List of public subnet IDs |
| `app_subnet_ids` | List of application subnet IDs |
| `db_subnet_ids` | List of database subnet IDs |
| `alb_dns_name` | DNS name of the Application Load Balancer |
| `db_instance_id` | ID of the RDS database instance |
| `dashboard_url` | URL of the CloudWatch dashboard |

### Cleanup

To destroy all resources created by this project, run:

Apply the configuration:

```bash
  terraform destroy
```

### Customization

You can customize the project by modifying the following files:

 • terraform.tfvars: For input variables.
 • modules/: For module configurations.

### Known Issues

1. Invalid AMI ID:
Ensure the ami_id specified in terraform.tfvars matches the region.

2. Region Mismatch:
If deploying to a region other than us-east-1, update the aws_region variable and adjust availability_zones.

### License

This project is licensed under the MIT License. See the LICENSE file for details.

### Contributing

Feel free to submit issues or pull requests for enhancements or bug fixes.
