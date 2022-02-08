#output "myoutput" {
#  description = "Description of my output"
#  value       = "value"
#  depends_on  = [<some resource>]
#}


output "namespace" {
  description = "The type of module where the cpd operator is deployed"
  value       = var.namespace
  depends_on  = [null_resource.setup_gitops]
}
