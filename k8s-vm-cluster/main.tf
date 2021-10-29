resource "nutanix_virtual_machine" "k8s_master" {
  count        = 2
  name         = "${var.vm_name}-master-${count.index + 1}"
  cluster_uuid = data.nutanix_cluster.cluster.id

  num_vcpus_per_socket = var.num_vcpus_per_socket_master
  num_sockets          = var.cpus_master
  memory_size_mib      = (var.ram_master * 1024)

  guest_customization_cloud_init_user_data = base64encode("${element(data.template_file.cloud.*.rendered, count.index)}")
  #Adaptador de red
  nic_list {
    subnet_uuid = data.nutanix_subnet.network.id
  }
  #Disco con la ISO ya preparada
  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_image.image.id
    }
    disk_size_mib = (var.disk_sizeroot_gb_master * 1024)
  }
}

resource "nutanix_virtual_machine" "k8s_etcd" {
  count        = 2
  name         = "${var.vm_name}-etcd-${count.index + 1}"
  cluster_uuid = data.nutanix_cluster.cluster.id

  num_vcpus_per_socket = var.num_vcpus_per_socket_etcd
  num_sockets          = var.cpus_etcd
  memory_size_mib      = (var.ram_etcd * 1024)

  guest_customization_cloud_init_user_data = base64encode("${element(data.template_file.cloud.*.rendered, count.index)}")
  #Adaptador de red
  nic_list {
    subnet_uuid = data.nutanix_subnet.network.id
  }
  #Disco con la ISO ya preparada
  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_image.image.id
    }
    disk_size_mib = (var.disk_sizeroot_gb_etcd * 1024)
  }
}

resource "nutanix_virtual_machine" "k8s_worker" {
  count        = 3
  name         = "${var.vm_name}-worker-${count.index + 1}"
  cluster_uuid = data.nutanix_cluster.cluster.id

  num_vcpus_per_socket = var.num_vcpus_per_socket_worker
  num_sockets          = var.cpus_worker
  memory_size_mib      = (var.ram_worker * 1024)

  guest_customization_cloud_init_user_data = base64encode("${element(data.template_file.cloud.*.rendered, count.index)}")
  #Adaptador de red
  nic_list {
    subnet_uuid = data.nutanix_subnet.network.id
  }
  #Disco con la ISO ya preparada
  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_image.image.id
    }
    disk_size_mib = (var.disk_sizeroot_gb_worker * 1024)
  }
}