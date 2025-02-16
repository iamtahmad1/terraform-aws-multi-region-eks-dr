module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  region          = var.region
}


module "eks" {
  source             = "../../modules/eks"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets
  private_subnet_ids = module.vpc.private_subnets
  enable_addons      = var.enable_addons
}


module "node_group" {
  source           = "../../modules/node-group"
  cluster_name     = module.eks.cluster_name
  node_group_name  = var.node_group_name
  instance_types   = var.instance_types
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
  subnet_ids       = module.vpc.private_subnets
}

module "iam" {
  source        = "../../modules/iam"
  eks_cluster_name  = module.eks.cluster_name
}

