data "nutanix_cluster" "cluster" {
    name = var.cluster_name
}

data "nutanix_subnet" "network" {
    subnet_name = var.nutanix_network
}