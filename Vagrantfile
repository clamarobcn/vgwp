Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "wordpress/", "/var/www/html"
  config.vm.network "forwarded_port", guest: 80, host: 8069
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.provision "shell", path: "bootstrap.sh"

end