#!/bin/bash 

vagrant destroy -f \
&& vagrant up \
&& sed -i '/#1/s/^/#/' Vagrantfile \
&& sed -i '/\#2/d' Vagrantfile \
&& vagrant provision \
&& vagrant ssh k8s-master -- -t 'kubectl get nodes && kubectl get pods -n kube-system' 
