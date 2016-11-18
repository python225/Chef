
#
# Cookbook Name:: patching
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if %w{debian ubuntu}.include?(node['platform'])
  Helper_Critical::update_ubuntu
  Helper_Critical::upgrade_ubuntu
else
    Helper_Critical::getlibstatus1
    Helper_Critical::getlibsta
	getparameters = Helper_Critical::getupdateinfo1
	Chef::Log.info(getparameters)
	ar = []
	getparameters.each_line { |line| ar << line.strip unless line == "\n" }
	ar.each do |name|
	  execute 'install_package' do
	  	command "yum install #{name} -y"
		end
	end
end

