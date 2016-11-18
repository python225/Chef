 require 'mixlib/shellout'
 class Helper_Security
	def self.getlibstatus
	  find = Mixlib::ShellOut.new("sudo yum check-update")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end

	def self.install_sec_pligin
	  find = Mixlib::ShellOut.new("yum install yum-plugin-security -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
	def self.getupdateinfo
	  find = Mixlib::ShellOut.new("yum update --security -y")
	  find.run_command
	  return find.stdout
	end


	def self.update_ubuntu
	  find = Mixlib::ShellOut.new("apt-get update -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
    
   
	#def self.getting_ubuntu
	 # find = Mixlib::ShellOut.new("grep security /etc/apt/sources.list > /tmp/security.list")
	 # find.run_command
	 # Chef::Log.info("#{find.stdout}")
	#end 

	#def self.install_security_ubuntu
	  #find = Mixlib::ShellOut.new("sudo apt-get upgrade -oDir::Etc::Sourcelist=/tmp/security.list -y")
	 # find.run_command
	 # Chef::Log.info("#{find.stdout}")
	#end
    
    def self.install_security_ubuntu
	  find = Mixlib::ShellOut.new("apt list --upgradable | grep -i security | grep -v 'Listing'  | grep upgradable | cut -d '/' -f1 | xargs apt-get install -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end


	def self.patch_security_suse
	  find = Mixlib::ShellOut.new("zypper patch --category security --with-interactive -y")
	  find.run_command
	  Chef::Log.info("#{find.stdout}")
	end
end
