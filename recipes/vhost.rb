#
# Cookbook Name:: laravel
# Recipe:: vhost
#
# Copyright 2013, Mathias Hansen
#

# Disable default vhost config (File.symlink? from the original apache_site definition doesn't work correctly)
execute "a2dissite default" do
  user "root"
  command "/usr/sbin/a2dissite 000-default"
  notifies :restart, resources(:service => "apache2")
end

# Define app name
app_name = "#{node['laravel']['name']}"

# Enable vhost
web_app "000-" + app_name do
  server_name node['laravel']['server_name']
  server_aliases node['laravel']['server_aliases']
  docroot node['laravel']['docroot']
  log_dir node['apache']['log_dir'] 
end