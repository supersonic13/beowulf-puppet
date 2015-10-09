# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.hostname = "node3"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

   config.vm.provider "virtualbox" do |vb|

    vb.memory = 512
    vb.cpus = 1
    #vb.customize ["modifyvm", :id, "--memory", mem]
    #vb.customize ["modifyvm", :id, "--cpus", cpus]

   end
end
