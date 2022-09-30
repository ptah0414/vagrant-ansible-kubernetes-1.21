#!/bin/bash 

vagrant destroy -f \
&& vagrant up \
&& sed '/#1/s/^/#/' Vagrantfile \
&& sed '/\#2/d' Vagrantfile \
&& vagrant provision \
&& vagrant ssh k8s-master \
&& kubectl get nodes \
&& kubectl get pods -n kube-system
