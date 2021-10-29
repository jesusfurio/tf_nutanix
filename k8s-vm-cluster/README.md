# Introduccion 
Módulo de Terraform para crear clusters de Kubernetes mediante el uso de VMs en Nutanix. El módulo está desarrollado para proporcionarle los datos de acceso a un servidor de Ansible mediante el cual ejecutar el Playbook correspondiente para configurarlo con RKE, Openshift o Kubernetes.

# Ejemplo de uso
```
module "k8s-cluster" {
  source = "./k8s-vm-cluster"

  #Cluster info vars
  cluster_name = var.cluster_name
  nutanix_network = var.nutanix_network
  nutanix_image = var.nutanix_image

  #AC variables
  ansible_user = var.ansible_user
  ansible_pass = var.ansible_pass
  ansible_ip = var.ansible_ip
  ansible_public_key = var.ansible_public_key
  inventory_file = var.inventory_file
  inventory_path = var.inventory_path

  #Cluster variable
  vm_name = var.vm_name

  #Master variables
  num_vcpus_per_socket_master = var.num_vcpus_per_socket_master
  cpus_master = var.cpus_master
  ram_master = var.ram_master
  disk_sizeroot_gb_master = var.disk_sizeroot_gb_master

  #ETCD variables
  num_vcpus_per_socket_etcd = var.num_vcpus_per_socket_etcd
  cpus_etcd = var.cpus_etcd
  ram_etcd = var.ram_etcd
  disk_sizeroot_gb_etcd = var.disk_sizeroot_gb_etcd

  #Workers variables
  num_vcpus_per_socket_worker = var.num_vcpus_per_socket_worker
  cpus_worker = var.cpus_worker
  ram_worker = var.ram_worker
  disk_sizeroot_gb_worker = var.disk_sizeroot_gb_worker
}
```
# Variables
| Nombre| Valor| DESCRIPCION|
| ----- | ---- | ---- |
| **cluster_name_** | *String* | Nombre del cluster de Nutanix. |
| **nutanix_network** | *String* | Nombre de la red donde desplegar el cluster. |
 | **nutanix_image** | *String* | Nombre dela imagen del SO a usar. |
| **ansible_user** | *String* | Usuario del servidor Ansible controller. |
| **ansible_pass** | *String* | Password del servidor Ansible controller. |
| **ansible_ip** | *String* | IP del servidor Ansible controller. |
| **ansible_public_key** | *String* | Llave pública del servidor Ansible controller. |
| **inventory_file** | *String* | Nombre del fichero de inventario. |
| **inventory_path** | *String* | Directorio donde irá el fichero de inventario en el servidor de Ansible. |
| **vm_name** | *String* | Prefijo para las VMs en Nutanix. |
| **num_vcpus_per_socket** | *String* | vCPUs por socket para las VMs. |
| **cpus_master** | *String* | vCPUs para las VMs. |
| **ram_master** | *String* | RAM para las VMs. |
| **disk_sizeroot_gb_master** | *String* | Capacidad en GB del disco. |

