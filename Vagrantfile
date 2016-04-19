# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos65"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "~/testbook/cookbooks"
    chef.add_recipe "testbook"
  end  

  config.vm.network "private_network", ip: "10.10.10.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
