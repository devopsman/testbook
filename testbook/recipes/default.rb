#
# Cookbook Name:: testbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'testbook::base'
include_recipe "testbook::tomcat_install"

# Disable standalone jenkins as we want to use it with Tomcat later
service 'jenkins' do
  action [ :stop, :disable ]
end

# Add jenkins.war to Tomcat
link '/var/tomcat8/webapps/jenkins.war' do
  to '/var/lib/jenkins/jenkins.war'
end

# Fix hostname
hostsfile_entry '10.10.10.10' do
  hostname node['set_fqdn']
  action :create
end

# Enable site for LAMP
web_app "my_lamp" do
  server_name node['set_fqdn']
  server_aliases [node['fqdn'], "my-lamp.local"]
  server_port 8888
  cookbook 'apache2'
  docroot "/var/www"
  directory_index "phpinfo.php"
end

# Put phpinfo
template '/var/www/phpinfo.php' do
  source 'phpinfo.erb'
  group 'root'
  owner 'root'
  mode 0644
  notifies :restart, 'service[apache2]', :immediately
end

include_recipe 'testbook::nginx-config'


# Allow 8080, 8888 from localhost
firewall_rule 'allow_http_8080' do
  port     [ 8080, 8888 ]
  source    '127.0.0.1'
  position 1
  command   :allow
end

# Deny 8080, 8888 from anything
firewall_rule 'drop_http_8080' do
  port     [ 8080, 8888 ]
  position 2
  command   :deny
end

# Allow remaining traffic
firewall_rule 'allow_all' do
  source    '0.0.0.0/0'
  position 3
  command   :allow
end