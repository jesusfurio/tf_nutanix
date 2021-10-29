[cluster]
[master]
%{ for ip in master_vm_ip ~}
${ip}
%{ endfor ~}
[etcd]
%{ for ip in etcd_vm_ip ~}
${ip}
%{ endfor ~}
[worker]
%{ for ip in worker_vm_ip ~}
${ip}
%{ endfor ~}
[cluster:children]
master
etcd
worker

