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
