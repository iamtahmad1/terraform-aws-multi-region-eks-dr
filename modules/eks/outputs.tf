output "cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.this.id
}

output "cluster_endpoint" {
  description = "EKS Cluster API endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_version" {
  description = "EKS Cluster Kubernetes version"
  value       = aws_eks_cluster.this.version
}

output "endpoint_private_access" {
  description = "Is private access to EKS endpoint enabled?"
  value       = aws_eks_cluster.this.vpc_config[0].endpoint_private_access
}

output "endpoint_public_access" {
  description = "Is public access to EKS endpoint enabled?"
  value       = aws_eks_cluster.this.vpc_config[0].endpoint_public_access
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}
