 require 'mixlib/shellout'
 class Helper
	 def self.getlibstatus
	  find = Mixlib::ShellOut.new("sudo yum check-update")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	 def self.getupdateinfo
	  find = Mixlib::ShellOut.new("yum update -y")
	  find.run_command
	  return find.stdout
	end

	def self.update_ubuntu
	  find = Mixlib::ShellOut.new("apt-get update -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	def self.upgrade_ubuntu_all
	  find = Mixlib::ShellOut.new("sudo apt-get upgrade -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	def self.refresh_suse
	  find = Mixlib::ShellOut.new("zypper refresh")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
	def self.patch_suse_all
	  find = Mixlib::ShellOut.new("zypper up -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
end