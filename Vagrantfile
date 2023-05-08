# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.hostname = "inception"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4098
    v.cpus = 4
    v.customize ["modifyvm", :id, "--vram", "12"]
  end
  config.vm.provision "shell", path: "./scripts/setup.sh", privileged: true
  config.vm.provision "shell", path: "./scripts/run_ansible.sh", privileged: false
  config.vm.provision "shell", path: "./scripts/setup_gui.sh", privileged: true
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
end
