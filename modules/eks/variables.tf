variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for EKS"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27"
}

variable "iam_role_name" {
  description = "Name of the IAM role for EKS cluster"
  type        = string
  default     = "eks-cluster-role"
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
  default     = false
}

variable "enable_coredns" {
  description = "Enable CoreDNS addon"
  type        = bool
  default     = true
}

variable "enable_kube_proxy" {
  description = "Enable Kube Proxy addon"
  type        = bool
  default     = true
}

variable "enable_vpc_cni" {
  description = "Enable VPC CNI addon"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}


variable "enable_addons" {
  description = "Enable EKS Add-ons"
  type        = bool
  default     = true
}