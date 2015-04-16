require 'socket'

local_ip = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[0][3]

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "couchdb-dev"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.network "forwarded_port", guest: 5984, host: 5984

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://" + local_ip + ":3128"
    config.proxy.https    = "http://" + local_ip + ":3128"
    config.proxy.no_proxy = "localhost,127.0.0.1," + local_ip
  end
end
