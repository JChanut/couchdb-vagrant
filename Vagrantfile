# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "couchdb-dev"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.network "forwarded_port", guest: 5984, host: 5984

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://#{`hostname`[0..-2]}:3128"
    config.proxy.https    = "http://#{`hostname`[0..-2]}:3128"
    config.proxy.no_proxy = "localhost,127.0.0.1,#{`hostname`[0..-2]}"
  end
end
