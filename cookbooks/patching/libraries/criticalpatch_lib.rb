 require 'mixlib/shellout'
 class Helper_Critical
	def self.getlibstatus1
	  find = Mixlib::ShellOut.new("yum repolist")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
	def self.getlibsta
	  find = Mixlib::ShellOut.new("sudo yum updateinfo list | grep -i critical > critical.patch.list.output")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	def self.getupdateinfo1
	  find = Mixlib::ShellOut.new("cat critical.patch.list.output | awk \'{print$3}\'")
	  find.run_command
	  return find.stdout
	  Chef::Log.info("#{find.stdout}")
	end

	def self.update_ubuntu
	  find = Mixlib::ShellOut.new("apt-get update -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	def self.upgrade_ubuntu
	  find = Mixlib::ShellOut.new("apt-get upgrade -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
end