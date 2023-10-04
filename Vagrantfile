# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER']

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.hostname = "#{LOCAL_USER}"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade -y
    sudo usermod -aG sudo vagrant

    apt-get install -y kde-standard

    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
    sudo usermod -aG docker vagrant

    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable

    sudo useradd -m -G sudo,docker,vagrant -s /bin/bash "#{LOCAL_USER}"
    echo "#{LOCAL_USER}:inception" | sudo chpasswd

    echo "export LOCAL_USER="#{LOCAL_USER}"" >> /home/"#{LOCAL_USER}"/.bashrc
    sudo shutdown -r now
  SHELL

  config.vm.synced_folder ".", "/vagrant", type: "rsync"
end
