#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "apt"

package 'apache2' do
  action :install
end

service 'apache2' do
  action [ :enable, :start ]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end
