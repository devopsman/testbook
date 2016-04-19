#
# Cookbook Name:: testbook
# Recipe:: base

include_recipe "java::default"
include_recipe "apache2::default"
include_recipe "apache2::mod_php5"
include_recipe "jenkins::master"
include_recipe "hostname::default"
include_recipe "nginx::default"
include_recipe "firewall::default"