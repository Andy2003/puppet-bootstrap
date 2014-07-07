# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "Ubuntu_14.04"
	config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
	config.vm.define :node1 do |node1|
	  node1.vm.hostname = "node1.local"
	  node1.vm.network :private_network, ip: "192.168.33.20"
	  node1.vm.provision "shell", inline: "
		apt-get install -y git >/dev/null
		git clone https://github.com/Andy2003/puppet-bootstrap.git /opt/puppet-bootstrap
		chmod +x /opt/puppet-bootstrap/boot.sh
		/opt/puppet-bootstrap/boot.sh"
	end
end
