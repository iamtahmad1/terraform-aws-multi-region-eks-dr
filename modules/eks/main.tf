resource "aws_iam_role" "eks_cluster" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = merge(var.tags, { Name = var.iam_role_name })
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = concat(var.public_subnet_ids, var.private_subnet_ids)
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
  }

  tags = merge(var.tags, { Name = var.cluster_name })
}

resource "aws_eks_addon" "coredns" {
  count        = var.enable_coredns ? 1 : 0
  cluster_name = aws_eks_cluster.this.name
  addon_name   = "coredns"
}

resource "aws_eks_addon" "kube_proxy" {
  count        = var.enable_kube_proxy ? 1 : 0
  cluster_name = aws_eks_cluster.this.name
  addon_name   = "kube-proxy"
}

resource "aws_eks_addon" "vpc_cni" {
  count        = var.enable_vpc_cni ? 1 : 0
  cluster_name = aws_eks_cluster.this.name
  addon_name   = "vpc-cni"
}