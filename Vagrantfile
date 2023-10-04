# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER']

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.hostname = "#{LOCAL_USER}"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y xfce4 lightdm lightdm-gtk-greeter
    sudo apt-get install -y git curl wget
    sudo apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common
    sudo usermod -aG sudo vagrant

    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker vagrant

    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable
  SHELL

  config.vm.provision "shell", inline: <<-SHELL
    sudo useradd -m -G sudo,docker -s /bin/bash "#{LOCAL_USER}"
    echo "#{LOCAL_USER}:inception" | sudo chpasswd
  SHELL

  config.vm.provision "shell", inline: <<-SHELL
    echo $LOCAL_USER="#{LOCAL_USER}" >> /home/"#{LOCAL_USER}"/.bashrc
    sudo shutdown -r now
  SHELL
end
