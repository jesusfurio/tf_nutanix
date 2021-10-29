data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}

data "nutanix_subnet" "network" {
  subnet_name = var.nutanix_network
}

data "nutanix_image" "image" {
  image_name = var.nutanix_image
}

data "template_file" "cloud" {
  template = file("./k8s-vm-cluster/cloud-init")
  vars = {
    vm_name = var.vm_name
    vm_user = var.ansible_user
    vm_public_key =var.ansible_public_key
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("./k8s-vm-cluster/inventory.tpl",
    {
     master_vm_ip = nutanix_virtual_machine.k8s_master.*.nic_list_status.0.ip_endpoint_list.0.ip
     etcd_vm_ip   = nutanix_virtual_machine.k8s_etcd.*.nic_list_status.0.ip_endpoint_list.0.ip
     worker_vm_ip = nutanix_virtual_machine.k8s_worker.*.nic_list_status.0.ip_endpoint_list.0.ip
    }
  )
  filename = "${var.inventory_file}"
  connection {
    type     = "ssh"
    user     = "${var.ansible_user}"
    password = "${var.ansible_pass}"
    host     = "${var.ansible_ip}"
  }
  provisioner "file" {
    source      = "${var.inventory_file}"
    destination = "${var.inventory_path}"
  }
}