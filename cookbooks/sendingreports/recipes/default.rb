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