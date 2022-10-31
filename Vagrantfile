# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
  "server0" => { :vm_id => "server0", :ip => "192.168.56.200", :cpus => 1, :mem => 4096, :box => "generic/rocky9"},
  "server1" => { :vm_id => "server1", :ip => "192.168.56.201", :cpus => 1, :mem => 2048, :box => "generic/rocky9"},
  "server2" => { :vm_id => "server2", :ip => "192.168.56.202", :cpus => 1, :mem => 2048, :box => "generic/rocky9"},
  "server3" => { :vm_id => "server3", :ip => "192.168.56.203", :cpus => 1, :mem => 2048, :box => "generic/rocky9"}
}

Vagrant.configure("2") do |config|

  config.vagrant.plugins = ["vagrant-vbguest", "vagrant-hostmanager"]

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vbguest.auto_update = true

  nodes.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|

        config.vm.box = info[:box]
        config.vm.box_check_update = true
        override.vm.hostname = hostname
        override.vm.network :private_network, ip: "#{info[:ip]}"
        vb.customize ["modifyvm", :id, "--name", info[:vm_id]]
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--largepages", "on"]
        vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--usb", "off"]
        vb.customize ["modifyvm", :id, "--usbehci", "off"]
        vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--cableconnected2", "on", "--hostonlyadapter2", "VirtualBox Host-Only Ethernet Adapter"]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
    end
  end

  config.vm.provision "file", source: "./id_ed25519", destination: "/home/vagrant/.ssh/id_ed25519"
  config.vm.provision "file", source: "./id_ed25519.pub", destination: "/home/vagrant/.ssh/id_ed25519.pub"
  config.vm.provision "shell", inline: <<-SHELL
    chmod 600 /home/vagrant/.ssh/id_ed25519
    cat /home/vagrant/.ssh/id_ed25519.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL

  config.vm.provision "shell", path: "bootstrap.sh"

end
