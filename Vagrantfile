Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.5"

  #config.hostmanager.enabled = true
  #config.hostmanager.manage_host = true
  #config.hostmanager.ignore_private_ip = false
  #config.hostmanager.include_offline = true

  config.vm.hostname = 'ngds'
  config.vm.network :private_network, ip: '192.168.10.42'

  config.vm.network "forwarded_port", guest: 8983, host: 8983
  config.vm.network "forwarded_port", guest: 5000, host: 5000  # paster server (development)

  #config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa' ]
  #config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision "shell", path: "scripts/provision.sh"

end
