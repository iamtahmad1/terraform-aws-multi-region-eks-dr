module "vpc" {
  source          = "./modules/vpc"
  cidr_block      = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  eks_role_arn = module.iam.eks_role_arn
}

module "node_group" {
  source         = "./modules/node-group"
  cluster_name   = var.cluster_name
  node_group_name = var.node_group_name
  subnet_ids     = module.vpc.private_subnets
  node_role_arn  = module.iam.node_role_arn
}
