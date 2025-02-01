# Create s3 bucket for terraform State and Lock
module "terraform_state" {
  source = "./modules/s3"
}
# Create VPC
module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  availability_zones = [data.aws_availability_zones.az.names]
  enable_nat_gateway = true
  enable_vpn_gateway = true
}

# Create EIP
module "eip" {
  source = "./modules/eip"
  depends_on = module.vpc.aws_vpc
}

# Create NAT Gateway
module "nat_gateway" {
  source = "./modules/nat"
  depends_on = [module.igw.igw_id,module.eip]
  vpc_id = module.vpc.vpc_id
  eip_id = module.eip.eip_id
  allocation_id = module.eip.eip_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
}

# Create NAT Gateway Route Table
module "nat_route" {
  source = "./modules/nat"
  depends_on = [module.vpc.aws_vpc,module.nat_gateway]
  vpc_id = module.vpc.vpc_id
  eip_id = module.eip.eip_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
}
#  Public/Private Subnet Association with NAT Gateway
module "private_subnets_association" {
  source = "./modules/nat"
  depends_on = [module.nat_route]
  private_subnets = module.vpc.private_subnets
  public_subnets = module.vpc.public_subnets
  eip_id = module.eip.eip_id
  vpc_id = module.vpc.vpc_id
}

#  Public Subnet Association with NAT Gateway
module "public_subnets_association" {
  source = "./modules/igw"
  depends_on = [module.igw_route]
  public_subnets = module.vpc.public_subnets
  eip_id = module.eip.eip_id
  vpc_id = module.vpc.vpc_id
}

# Create Internet Gateway
module "igw" {
  source = "./modules/igw"
  depends_on = [module.vpc.vpc_id]
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

# Create Internet Gateway Route Table
module "igw_route" {
  source = "./modules/igw"
  depends_on = [module.vpc.aws_vpc,module.igw.igw_id]
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}



# Create ECR
module "ecr" {
  source = "./modules/ecr"
  ecr_repositories = [module.ecr.ecr_repository_urls]
}

# Create EKS CLuster
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  subnet_ids      = concat(module.vpc.public_subnets, module.vpc.private_subnets)
  node_groups     = {
                      app_nodes = {
                        desired_capacity = 3
                        max_capacity     = 6
                        min_capacity     = 2
                        instance_type    = "t3.small"
                      }
                      }
  cluster_version = var.cluster_version
}


# Create RDS Instances
module "rds" {
  source          = "./modules/rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  db = var.db
  db_user         = var.db_user
  db_password     = var.db_password
  vpc_cidr = module.vpc.private_subnets
  subnet_ids = [module.vpc.private_subnets]
  postgres_version = var.postgres_version
  instance_class = var.instance_class
}



# Create Application Load balancer (ALB)
module "alb" {
  source       = "./modules/alb"
  vpc_id       = module.vpc.vpc_id
  private_subnets = [module.vpc.private_subnets]
  public_subnets = [module.vpc.public_subnets]
  subnet_ids   = [module.vpc.public_subnet_ids,module.vpc.private_subnet_ids]
  multi_az     = true
  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    },
  ]
}

