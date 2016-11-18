
Chef::Log.info("I am in platform #{node['platform']}")

if %w{rhel redhat}.include?(node['platform'])
  Helper_install::get_redhat_wget
  Helper_install::get_redhat_package
  Helper_install::get_redhat_rpm
  Helper_install::get_redhat_ssh
  template "#{node['patching']['scrpt_path']}/#{node['patching']['scrpt_file']}" do
  source "filecpy.sh.erb"
  mode 0755
  variables(
       :user=> node['patching']['user'],
       :ip=> node['patching']['ip'],
       :sourcefile=> node['patching']['sourcefile'],
       :destinationpath => node['patching']['destinationpath'],
       :password=> node['patching']['password']
  )
end

execute 'run_ssh_execute_bash' do
  cwd '/tmp/'
  command './filecpy.sh'
end




elsif %w{suse opensuse}.include?(node['platform'])
  Helper_install::get_suse_wget
  Helper_install::get_suse_package
  Helper_install::get_suse_rpm
  Helper_install::get_suse_ssh
 template "#{node['patching']['scrpt_path']}/#{node['patching']['scrpt_file']}" do
  source "filecpy.sh.erb"
  mode 0755
  variables(
       :user=> node['patching']['user'],
       :ip=> node['patching']['ip'],
       :sourcefile=> node['patching']['sourcefile'],
       :destinationpath => node['patching']['destinationpath'],
       :password=> node['patching']['password']
  )
end

execute 'run_ssh_execute_bash' do
  cwd '/tmp/'
  command './filecpy.sh'
end



elsif %w{centos}.include?(node['platform'])
  Helper_install::get_centos_wget
  Helper_install::get_centos_package
  Helper_install::get_centos_rpm
  Helper_install::get_centos_ssh
  template "#{node['patching']['scrpt_path']}/#{node['patching']['scrpt_file']}" do
  source "filecpy.sh.erb"
  mode 0755
  variables(
       :user=> node['patching']['user'],
       :ip=> node['patching']['ip'],
       :sourcefile=> node['patching']['sourcefile'],
       :destinationpath => node['patching']['destinationpath'],
       :password=> node['patching']['password']
  )
end

execute 'run_ssh_execute_bash' do
  cwd '/tmp/'
  command './filecpy.sh'
end

else %w{debian ubuntu}.include?(node['platform'])
package "sshpass"
template "#{node['patching']['scrpt_path']}/#{node['patching']['scrpt_file']}" do
  source "filecpy.sh.erb"
  mode 0755
  variables(
       :user=> node['patching']['user'],
       :ip=> node['patching']['ip'],
       :sourcefile=> node['patching']['sourcefile'],
       :destinationpath => node['patching']['destinationpath'],
       :password=> node['patching']['password']
  )
end

execute 'run_ssh_execute_bash' do
  cwd '/tmp/'
  command './filecpy.sh'
end
end
