# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "opscode-centos-6.6"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"


  config.vm.network "private_network", ip: "192.168.33.234"
  config.vm.define :vagrant_stress
  config.vm.provision "chef_solo" do |chef|
    chef.node_name = "node01"
  end
  
  # provisioning
  vagrant_json = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'vagrant_stress.json').read)

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.environments_path = "environments"
    chef.environment = vagrant_json.delete('environment')

    chef.run_list = vagrant_json.delete('run_list')
    chef.json = vagrant_json
  end
end
