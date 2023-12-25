Terraform Project: AWS Infrastructure Setup


Project Overview
This Terraform project automates the setup of infrastructure in AWS. It includes the creation of a VPC, subnets, security groups, RDS instances, and ECR repositories.

Prerequisites
Terraform installed 
AWS CLI installed and configured
AWS account with necessary permissions

Modules
VPC: Sets up a virtual private cloud.
Subnets: Configures public and private subnets within the VPC.
Security Groups: Creates security groups for application servers.
RDS Instance: Deploys an RDS instance for database needs.
ECR: Creates Elastic Container Registry repositories.

Usage
1. Clone the Repository

Copy code
git clone https://github.com/shoghikdeghoyan2992/softland.git
cd [repository_directory]

2. Initialize Terraform

Initialize Terraform to download the necessary providers.

Copy code
terraform init

3. Configure Variables

Edit the terraform.tfvars file to set your specific configuration values like vpc_cidr, number_of_subnets, etc.

4. Plan the Deployment

Run Terraform plan to review the changes that will be applied.

Copy code
terraform plan

5.Apply Configuration

Apply the Terraform configuration to start the deployment.

Copy code
terraform apply


Inputs and Outputs
* Inputs: Refer to variables.tf in each module for input variables.
* Outputs: After successful deployment, outputs like subnet IDs, VPC ID, etc., will be displayed.


Notes
* Ensure your AWS credentials are configured correctly.
* Review and customize the configurations as per your infrastructure requirements.

Contributing
* Contributions to this project are welcome. Please ensure to update this README accordingly with details of changes..


Project structure (draft)
.
├── main.tf              # Main Terraform configuration file
├── variables.tf         # Terraform variables declaration
├── outputs.tf           # Terraform outputs declaration
├── provider.tf          # Terraform provider configuration
├── terraform.tfvars     # Terraform variables definition file
└── modules              # Directory for Terraform modules
    ├── eks              # EKS module
    │   ├── main.tf      # EKS resource definitions
    │   ├── variables.tf # EKS module variables
    │   └── outputs.tf   # EKS module outputs
    ├── rds              # RDS module
    │   ├── main.tf      # RDS resource definitions
    │   ├── variables.tf # RDS module variables
    │   └── outputs.tf   # RDS module outputs
    ├── vpc              # VPC module
    │   ├── main.tf      # VPC resource definitions
    │   ├── variables.tf # VPC module variables
    │   └── outputs.tf   # VPC module outputs
    ├── ecr              # ECR module
    │   ├── main.tf      # ECR resource definitions
    │   ├── variables.tf # ECR module variables
    │   └── outputs.tf   # ECR module outputs
    ├── ingress          # Ingress module
    │   ├── main.tf      # Ingress resource definitions
    │   ├── variables.tf # Ingress module variables
    │   └── outputs.tf   # Ingress module outputs
    └── mq               # Message Queue (MQ) module
        ├── main.tf      # MQ resource definitions
        ├── variables.tf # MQ module variables
        └── outputs.tf   # MQ module outputs

