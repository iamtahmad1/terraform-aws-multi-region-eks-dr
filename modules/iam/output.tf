output "eks_iam_role_arn" {
  description = "ARN of the IAM role for EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = var.oidc_provider_arn != "" ? var.oidc_provider_arn : aws_iam_openid_connect_provider.eks_oidc[0].arn
}
