MASTER_COUNT = 2
NODE_COUNT = 2
IMAGE = "generic/debian9"

Vagrant.configure("2") do |config|
  config.vagrant.plugins = "vagrant-timezone"

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "UTC"
end

  (1..MASTER_COUNT).each do |i|
    config.vm.define "kubemaster#{i}" do |kubemasters|
      kubemasters.vm.box = IMAGE
      kubemasters.vm.hostname = "kubemaster#{i}"
      kubemasters.vm.network  :private_network, ip: "10.0.0.#{i+10}"
      kubemasters.vm.provision "file", source: "./.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
      kubemasters.vm.provision "file", source: "./.ssh/id_rsa", destination: "/tmp/id_rsa"
      kubemasters.vm.provision "shell", privileged: true,  path: "scripts/master_install.sh"
    end
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "kubenode#{i}" do |kubenodes|
      kubenodes.vm.box = IMAGE
      kubenodes.vm.hostname = "kubenode#{i}"
      kubenodes.vm.network  :private_network, ip: "10.0.0.#{i+20}"
      kubenodes.vm.provision "file", source: "./.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
      kubenodes.vm.provision "file", source: "./.ssh/id_rsa", destination: "/tmp/id_rsa"
      kubenodes.vm.provision "shell", privileged: true,  path: "scripts/node_install.sh"
    end
  end
end