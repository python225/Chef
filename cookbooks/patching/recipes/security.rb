#
# Cookbook Name:: patching
# Recipe:: security
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
  LinuxCommand::package_names_rhel_sec.each_line { |line| getpack << line.strip unless line == "\n" }
  node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_rhel_sec
elsif %w{suse opensuse}.include?(node['platform'])
	getpack = []
  LinuxCommand::package_names_suse_sec.each_line { |line| getpack << line.strip unless line == "\n" }
  node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_suse_sec
elsif %w{centos}.include?(node['platform'])
  getpack = []
  LinuxCommand::package_names_centos_sec.each_line { |line| getpack << line.strip unless line == "\n" }
  node.run_state['get_name'] = getpack.join(";")
  node.run_state['get_number'] = LinuxCommand::number_packages_centos_sec
elsif %w{debian ubuntu}.include?(node['platform'])
	getpack = []
  LinuxCommand::package_names_ubuntu_sec.each_line { |line| getpack << line.strip unless line == "\n" }
  node.run_state['get_name'] = getpack.join(";")
	node.run_state['get_number'] = LinuxCommand::number_packages_ubuntu_sec
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
   LinuxCommand::package_names_ubuntu_sec.each_line { |line| getpack << line.strip unless line == "\n" }
   node.run_state['get_name'] = getpack.join(";")
   node.run_state['get_number'] = LinuxCommand::number_packages_ubuntu_sec
   chef_handler "Chef::Handler::AwesomeReportHandler" do
   source "/tmp/myhandler/handler_report.rb"
   arguments(
  	:packages_installed => node.run_state['get_number'],
  	:packages_name => node.run_state['get_name']
  )
   action :enable
  end
    Helper_Security::update_ubuntu
    #Helper_Security::getting_ubuntu
    Helper_Security::install_security_ubuntu
  # reboot 'ubuntu_patch' do
	#  action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	#  delay_mins 1
	#end

  elsif %w{suse opensuse}.include?(node['platform'])

	 getpack = []
   LinuxCommand::package_names_suse_sec.each_line { |line| getpack << line.strip unless line == "\n" }
   node.run_state['get_name'] = getpack.join(";")
   node.run_state['get_number'] = LinuxCommand::number_packages_suse_sec
    chef_handler "Chef::Handler::AwesomeReportHandler" do
    source "/tmp/myhandler/handler_report.rb"
    arguments(
  	:packages_installed => node.run_state['get_number'],
  	:packages_name => node.run_state['get_name']
  )
    action :enable
  end
	  Helper_Security::patch_security_suse
	#reboot 'suse_patch' do
	#  action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	#  delay_mins 1
	#end
  elsif %w{centos}.include?(node['platform'])

    Helper_Security::install_sec_pligin
    getpack = []
    LinuxCommand::package_names_centos_sec.each_line { |line| getpack << line.strip unless line == "\n" }
    node.run_state['get_name'] = getpack.join(";")
    node.run_state['get_number'] = LinuxCommand::number_packages_centos_sec
    chef_handler "Chef::Handler::AwesomeReportHandler" do
    source "/tmp/myhandler/handler_report.rb"
    arguments(
    :packages_installed => node.run_state['get_number'],
    :packages_name => node.run_state['get_name']
  )
    action :enable
  end

    Helper_Security::getlibstatus
    Helper_Security::getupdateinfo  
  #reboot 'rhel_centos_patch' do
  #  action :request_reboot
  #  reason 'Need to reboot when the run completes successfully.'
  # delay_mins 1
  #end
  
  else
	 getpack = []
   LinuxCommand::package_names_rhel_sec.each_line { |line| getpack << line.strip unless line == "\n" }
   node.run_state['get_name'] = getpack.join(";")
   node.run_state['get_number'] = LinuxCommand::number_packages_rhel_sec
    chef_handler "Chef::Handler::AwesomeReportHandler" do
    source "/tmp/myhandler/handler_report.rb"
    arguments(
  	:packages_installed => node.run_state['get_number'],
  	:packages_name => node.run_state['get_name']
  )
    action :enable
  end

	Helper_Security::getlibstatus
    Helper_Security::getupdateinfo	
	#reboot 'rhel_centos_patch' do
	#  action :request_reboot
	#  reason 'Need to reboot when the run completes successfully.'
	# delay_mins 1
	#end
end






