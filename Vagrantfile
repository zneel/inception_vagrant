# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "inception"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 4098
    v.cpus = 4
    v.customize ["modifyvm", :id, "--vram", "12"]
  end
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.provision :shell, inline: "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub|sudo apt-key add -"
  config.vm.provision :shell, inline: "sudo sh -c 'echo \"deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main\" > /etc/apt/sources.list.d/google.list'"
  config.vm.provision :shell, inline: "sudo apt update -y"
  config.vm.provision :shell, inline: "sudo apt upgrade -y"
  config.vm.provision :shell, inline: "sudo apt install -y --no-install-recommends ubuntu-desktop"
  config.vm.provision :shell, inline: "sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
  config.vm.provision :shell, inline: "sudo apt install -y build-essential"
  config.vm.provision :shell, inline: "sudo apt install -y clang"
  config.vm.provision :shell, inline: "sudo apt install -y vim"
  config.vm.provision :shell, inline: "sudo apt install -y git"
  config.vm.provision :shell, inline: "sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh"
  config.vm.provision :shell, inline: "sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose"
  config.vm.provision :shell, env: {LOCAL_USER:ENV['USER']}, inline: "adduser $LOCAL_USER <<EOF
vagrant
vagrant
EOF"
  config.vm.provision :shell, env: {LOCAL_USER:ENV['USER']}, inline: "sudo usermod -a -G sudo $LOCAL_USER"
  config.vm.provision :shell, env: {LOCAL_USER:ENV['USER']}, inline: "sudo usermod -a -G docker $LOCAL_USER"
  config.vm.provision :shell, inline: "sudo usermod -a -G sudo vagrant"
  config.vm.provision :shell, inline: "sudo usermod -a -G docker vagrant"
  config.vm.provision :shell, inline: "sudo apt install -y google-chrome-stable"
  config.vm.provision :shell, inline: "sudo apt install -y chromium-browser"
  config.vm.provision :shell, inline: "sudo apt install -y firefox"
  config.vm.provision :shell, inline: "sudo chown -R ${LOCAL_USER}:${LOCAL_USER} /home/${LOCAL_USER}/.docker"
  config.vm.provision :shell, inline: "sudo shutdown -r now"
end
