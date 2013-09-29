#
# Cookbook Name:: laravel
# Recipe:: web_server
#
# Copyright 2013, Mathias Hansen
#

# Makes sure apt is up to date
include_recipe "apt"

# Install Apache
include_recipe "openssl"
include_recipe "apache2"

# Install PHP 5.5
apt_repository "php55" do
	uri "http://ppa.launchpad.net/ondrej/php5/ubuntu"
	distribution node['lsb']['codename']
	components ["main"]
	keyserver "keyserver.ubuntu.com"
	key "E5267A6C"
end
include_recipe "php"

# Install xdebug
include_recipe "chef-php-extra::xdebug"

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end