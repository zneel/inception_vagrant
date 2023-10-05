# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER']

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.hostname = "#{LOCAL_USER}"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt update -y
    sudo apt install git vim wget curl -y
    sudo usermod -aG sudo vagrant

    sudo apt install task-gnome-desktop -y

    sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
    sudo usermod -aG docker vagrant
  SHELL

  config.vm.provision "shell", inline: "sudo adduser #{LOCAL_USER} <<EOF
vagrant
vagrant
EOF"

  config.vm.provision "shell", inline: <<-SHELL
    sudo usermod -aG sudo "#{LOCAL_USER}"
    sudo usermod -aG docker "#{LOCAL_USER}"
    sudo usermod -aG vagrant "#{LOCAL_USER}"
    echo "export LOCAL_USER="#{LOCAL_USER}"" >> /home/"#{LOCAL_USER}"/.bashrc
    sudo shutdown -r now
  SHELL
end
