
# Module for VPC
module "vpc" {
  source = "./modules/vpc"
  enable_nat_gateway = true
  enable_vpn_gateway = true
}

# Module for EKS
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  #subnet_ids      = concat(module.vpc.public_subnets, module.vpc.private_subnets)
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


# Module for RDS
module "rds" {
  source          = "./modules/rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  db_user         = var.db_user
  db_password     = var.db_password
}



# Module for ELB
module "alb" {
  source       = "./modules/alb"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnets
#  target_group = module.eks.target_group_arn
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
