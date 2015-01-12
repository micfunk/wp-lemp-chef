# -*- mode: ruby -*-
# vim: set ft=ruby :

mysql_root_password   = "root"

Vagrant.configure("2") do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "http://files.vagrantup.com/trusty64.box"
  config.vm.network :private_network, ip: '192.168.10.20'
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "wp"
    chef.json = {
      :nginx => {
        :default_site_enabled => true
        },
        :mysql =>
          {
            :server_root_password => mysql_root_password,
            :server_repl_password => mysql_root_password,
            :server_debian_password => mysql_root_password,
          },
      }
  end
end