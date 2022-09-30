IMAGE_NAME = "generic/ubuntu2004"
N = 3

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "libvirt" do |v|
        v.memory = 8192
        v.cpus = 4
    end

    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "10.10.10.10"
	master.vm.network "public_network", :dev => "br0", :type =>"bridge"  
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible" do |ansible|                              #1 
           ansible.playbook = "kubernetes-setup/master-playbook.yml"            #1 
            ansible.extra_vars = {                                              #1 
                node_ip: "10.10.10.10",                                         #1 
            }                                                                   #1 
        end                                                                     #1 
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.10.10.#{i + 10}"
	    node.vm.network "public_network", :dev => "br0", :type =>"bridge" 
            node.vm.hostname = "node-#{i}"
#            node.vm.provision "ansible" do |ansible|                           #2 
#                ansible.playbook = "kubernetes-setup/node-playbook.yml"        #2 
#                ansible.extra_vars = {                                         #2
#                    node_ip: "10.10.10.#{i + 10}",                             #2 
#                }                                                              #2 
#            end                                                                #2 
        end
    end
end
