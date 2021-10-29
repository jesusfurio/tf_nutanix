#####################
# Data variables #
#####################
variable "nutanix_network" {}
variable "nutanix_image" {}
variable "cluster_name" {}

################
# AC variables #
################
variable "ansible_user" {}
variable "ansible_pass" {}
variable "ansible_ip" {}
variable "ansible_public_key" {}
variable "inventory_file" {}
variable "inventory_path" {}

#########################
# Cluster VMs variables #
#########################
variable "vm_name" {}

########################
# Master VMs variables #
########################
variable "num_vcpus_per_socket_master" {}
variable "cpus_master" {}
variable "ram_master" {}
variable "disk_sizeroot_gb_master" {}

######################
# ETCD VMs variables #
######################
variable "num_vcpus_per_socket_etcd" {}
variable "cpus_etcd" {}
variable "ram_etcd" {}
variable "disk_sizeroot_gb_etcd" {}

########################
# Worker VMs variables #
########################
variable "num_vcpus_per_socket_worker" {}
variable "cpus_worker" {}
variable "ram_worker" {}
variable "disk_sizeroot_gb_worker" {}