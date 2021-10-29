resource "nutanix_karbon_cluster" "karbon_prod" {
    name = var.k8s_name
    version = var.k8s_version
    single_master_config {}

    storage_class_config {
        name = "default-storageclass"
        reclaim_policy = "Delete"
        volumes_config {
            file_system = "ext4"
            password = var.clusterpassword
            prism_element_cluster_uuid = data.nutanix_cluster.cluster.id
            storage_container = var.storage_container_name
            username = var.clusteruser
        }
    }

    etcd_node_pool {
        name = "etcd-node-pool"
        node_os_version = var.node_os_version
        num_instances = 1
        ahv_config {
            cpu = 4
            disk_mib = 81920
            memory_mib = 8192
            network_uuid = data.nutanix_subnet.network.id
            prism_element_cluster_uuid = data.nutanix_cluster.cluster.id
        }
    }

    master_node_pool {
        name = "master-node-pool"
        node_os_version = var.node_os_version
        num_instances = 1
        ahv_config {
            cpu = 4
            disk_mib = 122880
            memory_mib = 6144
            network_uuid = data.nutanix_subnet.network.id
            prism_element_cluster_uuid = data.nutanix_cluster.cluster.id
        }
        
    }

    worker_node_pool {
        name = "worker-node-pool"
        node_os_version = var.node_os_version
        num_instances = var.worker_num_instances
        ahv_config {
            cpu = var.worker_cpu
            disk_mib = (var.worker_disk * 1024)
            memory_mib = (var.worker_ram * 1024)
            network_uuid = data.nutanix_subnet.network.id
            prism_element_cluster_uuid = data.nutanix_cluster.cluster.id
        }
    }

    cni_config {
        flannel_config {}
        pod_ipv4_cidr = "172.20.0.0/16"
        service_ipv4_cidr = "172.19.0.0/16" 
    }
}