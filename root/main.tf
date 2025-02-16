provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}

module "iam" {
  source = "./modules/iam"
  eks_cluster_name = var.cluster_name
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnets
  cluster_role_arn = module.iam.eks_iam_role_arn
  enable_addons = var.enable_addons
}

module "node_group" {
  source          = "./modules/node-group"
  cluster_name    = module.eks.cluster_name
  node_group_name = var.node_group_name
  subnet_ids      = module.vpc.private_subnets
  instance_types  = var.instance_types
  desired_capacity = var.desired_capacity
  min_size        = var.min_size
  max_size        = var.max_size
}