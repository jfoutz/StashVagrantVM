# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "cent64-puppet"
	config.vm.provision "shell", path: "script.sh"
    config.vm.network "forwarded_port", guest: 7990, host: 8080
end
