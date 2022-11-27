Vagrant.configure("2") do |config|
  config.vm.box = "rockylinux/8"
 
  config.vm.network "public_network" 
  config.vm.network "forwarded_port", guest: 8080, host: 1339

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = "1024"
  end
  config.ssh.username = 'root'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true' 
  config.vm.provision "shell" do |shell|
    shell.path = "jenkins.sh"
  end
end
