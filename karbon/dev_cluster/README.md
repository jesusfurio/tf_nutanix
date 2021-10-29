# Introduccion 
Módulo de Terraform para crear clusters de Karbon de desarrollo. 

# Ejemplo de uso
Código de ejemplo de uso del módulo destinado a la creación de clusters de Karbon para uso de desarrollo. Este código deberá usarse en el main.tf desde el que vayamos a crear nuestra infraestructura.

```
module "karbon-dev" {
  source = "./karbon/pro_cluster"
  #Prism vars
  clusteruser = var.clusteruser
  clusterpassword = var.clusterpassword
  nutanix_network = var.nutanix_network
  cluster_name = var.cluster_name

  #Karbon cluster vars
  k8s_name = var.k8s_name
  k8s_version = var.k8s_version
  node_os_version = var.node_os_version
  
  #Karbon workers vars
  storage_container_name = var.storage_container_name
  worker_num_instances = var.worker_num_instances
  worker_ram = var.worker_ram
  worker_cpu = var.worker_cpu
  worker_disk = var.worker_disk
}
```
# Variables
| Nombre| Valor| DESCRIPCION|
| ----- | ---- | ---- |
| **clusteruser** | *String* | Usuario administrador Nutanix. |
| **clusterpassword** | *String* | Password usuario administrador. |
| **nutanix_network** | *String* | Nombre de la red donde desplegar el cluster. |
| **cluster_name_** | *String* | Nombre del cluster de Nutanix. |
| **k8s_name** | *String* | Nombre del cluster de Karbon. Seguimos nomenclatura indicada abajo. |
| **k8s_version** | *String* | Versión de Kubernetes. Se especifican las disponibles abajo. |
| **node_os_version** | *String* | Versión OS de los nodos. Se especifican más abajo. |
| **storage_container_name** | *String* | Nombre del datastore que usaremos. |
| **worker_num_instances** | *Integer* | Número de workers que necesitaremos. |
| **worker_num_ram** | *Integer* | Ram que asignaremos al worker, en gigas. |
| **worker_num_cpu** | *Integer* | Número de cpus. |
| **worker_num_disk** | *Integer* | Tamaño del disco de los workers. En gigas y mínimo 120. |
