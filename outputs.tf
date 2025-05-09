output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

# output "instance_id" {
#   value = module.compute.instance_id
# }

# output "gke_cluster_id" {
#   value = module.gke.cluster_id
# }
