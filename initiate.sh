#!/bin/bash 

# create k8s-master and nodes. provision k8s-master
vagrant destroy -f \
&& vagrant up \
# provision nodes 
&& sed '/#1/s/^/#/' Vagrantfile \
&& sed '/\#2/d' Vagrantfile \
&& vagrant provision
