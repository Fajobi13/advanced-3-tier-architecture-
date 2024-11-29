
from diagrams import Diagram, Cluster
from diagrams.aws.network import ALB, VPC, InternetGateway
from diagrams.aws.compute import EC2AutoScaling
from diagrams.aws.database import RDS
from diagrams.aws.management import Cloudwatch
from diagrams.aws.security import IAMRole
from diagrams.generic.storage import Storage

# Create a diagram
with Diagram("3-Tier Architecture on AWS", show=False):
    
    # Networking Layer
    with Cluster("Networking"):
        igw = InternetGateway("Internet Gateway")
        vpc = VPC("Main VPC")
        alb = ALB("Application Load Balancer")
    
    # Application Layer
    with Cluster("Application Tier"):
        asg = EC2AutoScaling("Auto Scaling Group")
        ec2_instances = [asg]  # ASG will manage instances
    
    # Database Layer
    with Cluster("Database Tier"):
        rds = RDS("RDS MySQL")

    # Monitoring
    cloudwatch = Cloudwatch("CloudWatch Dashboard")
    
    # Roles
    iam_role = IAMRole("IAM Role")

    # Architecture
    igw >> vpc >> alb >> asg >> rds
    alb >> cloudwatch  # Monitoring ALB traffic
    rds >> cloudwatch  # Monitoring DB metrics
    asg >> iam_role  # EC2 Role for Application Tier