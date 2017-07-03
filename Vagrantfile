Vagrant.configure("2") do |config|
  config.vm.box = "arnemertz/Xubuntu16.04"
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
  config.vm.provider "virtualbox" do |v|
    v.name = "Rails Vagrant"
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :shell, path: "vagrant_provision.sh", privileged: false
  config.vm.provision :shell, path: "vagrant_up.sh", run: 'always'
end
