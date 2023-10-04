# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER']

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.hostname = "#{LOCAL_USER}.42.fr"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Installation d'XFCE
    sudo apt-get update
    sudo apt-get install -y xfce4 lightdm lightdm-gtk-greeter
    sudo apt-get install -y curl wget
    sudo apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common
    sudo usermod -aG sudo vagrant

    # Installer Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker vagrant

    # Installer Google Chrome
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable
    sudo useradd -m -G sudo,docker -s /bin/bash $LOCAL_USER
    echo "$LOCAL_USER:inception" | sudo chpasswd
    sudo shutdown -r now
  SHELL
end
