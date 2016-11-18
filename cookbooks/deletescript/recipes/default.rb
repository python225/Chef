#
# Cookbook Name:: deletescript
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file '/tmp/filecpy.sh' do
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end