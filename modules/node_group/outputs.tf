
output "node_group_id" {
  description = "EKS Node Group ID"
  value       = aws_eks_node_group.this.id
}

output "node_group_status" {
  description = "EKS Node Group status"
  value       = aws_eks_node_group.this.status
}