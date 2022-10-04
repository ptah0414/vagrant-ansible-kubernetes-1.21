# Kubernetes 1.21 Setup Using Ansible and Vagrant
 
## Prerequisite
### Install Vagrant and Ansible 
- Install Ansible 
```shell
yum -y install epel-release 
yum -y install ansible 
```

- Add vagrant repo 
```shell
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

- Install vagrant and related packages  
```shell
yum -y install libvirt-daemon-kvm libvirt-client vagrant gcc-c++ make libstdc++-devel libvirt-devel
```

- restart libvirt
```shell
systemctl restart libvirtd
```

- Install vagrant-libvirt plugin  
```shell
vagrant plugin install vagrant-libvirt
```

## Kubernetes Setup 
step 1. Enter your username and password in master-playbook.yml file
```yaml 
  - name: Log into DockerHub
    docker_login:
      username: [your username, not email address]
      password: [your password]
```

step 2. Customize the number of Worker Nodes in Vagrantfile 
```ruby 
N = 3
```

step 3. Customize the resources of VMs in Vagrantfile 
```ruby 
    config.vm.provider "libvirt" do |v|
        v.memory = 2048
        v.cpus = 2
    end
```
- min_requirements
  - v.memory = 2048
  - v.cpus = 2 

step 4. Run initiate.sh file 
```shell
./initiate.sh
```
