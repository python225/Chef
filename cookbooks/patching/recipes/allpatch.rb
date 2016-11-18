#
# Cookbook Name:: patching
# Recipe:: allpatch
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "chef_handler"
Chef::Log.info("I am in platform #{node['platform']}")



directory '/tmp/myhandler' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
directory '/tmp/silicus' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/tmp/silicus/reports' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :delete
end


directory '/tmp/silicus/reports' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


cookbook_file "/tmp/myhandler/handler_report.rb" do
  source "report_patch.rb"
  owner "root"
  group "root"
  mode 00755
  action :create
end

=begin
if %w{rhel redhat}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_rhel.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_rhel
elsif %w{suse opensuse}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_suse.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_suse
elsif %w{debian ubuntu}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_ubuntu.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_ubuntu
elsif %w{centos}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_centos.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_centos
end
=end

chef_handler "Chef::Handler::AwesomeReportHandler" do
  source "/tmp/myhandler/handler_report.rb"
  arguments(
  	:packages_installed => node.run_state['get_number'],
  	:packages_name => node.run_state['get_name']
  )
  action :enable
end

if %w{debian ubuntu}.include?(node['platform'])
  getpack = []
	LinuxCommand::package_names_ubuntu.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_ubuntu
  chef_handler "Chef::Handler::AwesomeReportHandler" do
  source "/tmp/myhandler/handler_report.rb"
  arguments(
  	:packages_installed => node.run_state['get_number'],
  	:packages_name => node.run_state['get_name']
  )
  action :enable
end
  Helper::update_ubuntu
  Helper::upgrade_ubuntu_all
  
  
  #reboot 'ubuntu_patch' do
	#  action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	#  delay_mins 1
	#end  
elsif %w{suse opensuse}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_suse.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_suse
	 chef_handler "Chef::Handler::AwesomeReportHandler" do
	  source "/tmp/myhandler/handler_report.rb"
	  arguments(
	  	:packages_installed => node.run_state['get_number'],
	  	:packages_name => node.run_state['get_name']
	  )
	  action :enable
	end
	Helper::refresh_suse
	Helper::patch_suse_all
	
	#reboot 'suse_patch' do
	# action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	#  delay_mins 1
	# end
elsif %w{centos}.include?(node['platform'])
	getpack = []
	LinuxCommand::package_names_centos.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_centos
	 chef_handler "Chef::Handler::AwesomeReportHandler" do
	  source "/tmp/myhandler/handler_report.rb"
	  arguments(
	  	:packages_installed => node.run_state['get_number'],
	  	:packages_name => node.run_state['get_name']
	  )
	  action :enable
	end
	Helper::getlibstatus
	Helper::getupdateinfo
	
	#reboot 'suse_patch' do
	# action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	#  delay_mins 1
	# end
else
    
    
    getpack = []
	LinuxCommand::package_names_rhel.each_line { |line| getpack << line.strip unless line == "\n" }
	node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_rhel
		chef_handler "Chef::Handler::AwesomeReportHandler" do
	     source "/tmp/myhandler/handler_report.rb"
	     arguments(
	  	:packages_installed => node.run_state['get_number'],
	  	:packages_name => node.run_state['get_name']
	  )
	  action :enable
	end
	Helper::getlibstatus
	Helper::getupdateinfo
	
	#	reboot 'rhel_centos_patch' do
	#	  action :request_reboot
	#	  reason 'Need to reboot when the run completes successfully.'
	#	  delay_mins 1
	#	end
	
end
