#
# Cookbook Name:: wp
# Recipe:: default
#


include_recipe 'nginx'
include_recipe 'php5-fpm::install'
include_recipe 'php5-fpm::create_user'
include_recipe 'memcached'
#include_recipe 'database::mysql'

# install php packages
%w{php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcached php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xcache}.each do |pkg|
  package pkg do
    action :install
  end
end

#create vagrant directory

directory node['nginx']['webroot'] do
  recursive true
  owner 'vagrant'
  group "www-data"
  mode 00755
  action :create
end

# create nginx server block file
template "#{node['nginx']['dir']}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 00755
end


mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  version '5.6'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password 'root'
  action [:create, :start]
end

# This should be for use with the 'database' cookbook from OpsCode, but that cookbook
# currently has dependency issues so will not work. We can try other approaches but
# haven't yet.

# conn_info = {
#   :host => "localhost",
#   :username => "root",
#   :password => node['mysql']['server_root_password']
# }

# mysql_database 'wordpress' do
#   connection conn_info
#   action :create
# end

# mysql_database_user 'wordpress' do
#   connection conn_info
#   password   node['mysql']['server_root_password']
#   action     :create
# end

# mysql_database_user 'wordpress' do
#   conn_info
#   password       node['mysql']['server_root_password']
#   database_name 'wordpress'
#   host          'localhost'
#   action        :grant
# end