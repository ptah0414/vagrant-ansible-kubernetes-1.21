# vagrant-ansible-kubernetes
 
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
