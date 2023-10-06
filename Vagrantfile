# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER']

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "#{LOCAL_USER}"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt update -y
    sudo apt install git vim wget curl -y

    sudo apt install --no-install-recommends ubuntu-desktop -y
    sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh

    sudo apt install firefox -y
  SHELL

  config.vm.provision "shell", inline: "sudo adduser #{LOCAL_USER} <<EOF
vagrant
vagrant
EOF"

  config.vm.provision "shell", inline: <<-SHELL
    sudo groupadd docker
    sudo usermod -aG sudo "#{LOCAL_USER}"
    sudo usermod -aG docker "#{LOCAL_USER}"
    newgrp docker
    sudo chown "#{LOCAL_USER}":"#{LOCAL_USER}" /home/"#{LOCAL_USER}"/.docker -R
    sudo chmod g+rwx /home/"#{LOCAL_USER}"/.docker -R
    sudo shutdown -r now
  SHELL
end
