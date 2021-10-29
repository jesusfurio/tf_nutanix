# Módulos Terraform para Nutanix
Repositorio con módulos de Terraform para Nutanix:
* k8s-vm-cluster: despliegue de un cluster de VMs listas para ser usadas y configuradas con un Playbook de Ansible que instale, por ejemplo, Opensifht o RKE. En las variables se debe especificar los datos del servidor de Ansible controller donde se alamacenará el inventario y desde el que se ejecutará el correspondiente Playbook.
* karbon: contiene dos modulos para desplegar clusters productivos y de desarrollo con la plataforma Karbon de Nutanix.