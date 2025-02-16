resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.eks_cluster_name}-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_role_policy_attachment" "eks_policies" {
  count      = length(var.iam_policies)
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = var.iam_policies[count.index]
}

resource "aws_iam_openid_connect_provider" "eks_oidc" {
  count           = var.oidc_provider_arn == "" ? 1 : 0
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [] # You need to manually fetch the thumbprint
  url             = "https://oidc.eks.${var.eks_cluster_name}.amazonaws.com"
}