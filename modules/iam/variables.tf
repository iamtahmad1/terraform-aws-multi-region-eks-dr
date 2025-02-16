variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name for EKS cluster"
  type        = string
  default     = "eks-cluster-role"
}

variable "iam_policies" {
  description = "List of IAM policies to attach to the EKS IAM role"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  ]
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider for the EKS cluster"
  type        = string
  default     = ""
}