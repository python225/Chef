class LinuxCommand

	#This is for getting the number of All patches and names of the redhat
	def self.package_names_rhel
	  find = Mixlib::ShellOut.new("yum updateinfo list | grep -v 'skipping' | grep -v 'firmware' | grep -v 'langpacks' | grep -v 'owner' | grep -v 'updateinfo' | awk \'{print$3}\'")
	  find.run_command
	  return find.stdout 
	end

	def self.number_packages_rhel
	  find = Mixlib::ShellOut.new("yum updateinfo list | grep -v 'skipping' | grep -v 'firmware' | grep -v 'langpacks' | grep -v 'owner' | grep -v 'updateinfo' | wc -l")
	  find.run_command
	  return find.stdout
	end

	#This is for getting the number of security patches and names of the redhat 

	def self.number_packages_rhel_sec
	  find = Mixlib::ShellOut.new("yum updateinfo list | grep -i Sec | grep -v 'skipping' | grep -v 'firmware' | grep -v 'langpacks' | grep -v 'owner' | grep -v 'updateinfo' | wc -l")
	  find.run_command
	  return find.stdout
	end


    def self.package_names_rhel_sec
	  find = Mixlib::ShellOut.new("yum updateinfo list | grep -i Sec | grep -v 'skipping' | grep -v 'firmware' | grep -v 'langpacks' | grep -v 'owner' | grep -v 'updateinfo' | awk \'{print$3}\'")
	  find.run_command
	  return find.stdout
	end 

#This is for getting the number of All patches and names of the centos
	
	def self.package_names_centos
	  #find = Mixlib::ShellOut.new("yum check-update | grep -v 'Loaded' |grep -v 'mirror'| grep updates | awk \'{print$1}\'")
	  find = Mixlib::ShellOut.new("yum check-update |grep -v 'Loaded' | grep -v Loading | grep -v 'mirror' | awk \'{print$1}\'")
	  find.run_command
	  return find.stdout 
	end

	def self.number_packages_centos
	  #find = Mixlib::ShellOut.new("yum check-update | grep -v 'Loaded' | grep -v 'mirror'| grep updates | wc -l")
	  find = Mixlib::ShellOut.new("yum check-update |grep -v 'Loaded' | grep -v Loading | grep -v 'mirror' | wc -l")
	  find.run_command
	  return find.stdout
	end

	#This is for getting the number of security patches and names of the centos

	def self.number_packages_centos_sec
	  find = Mixlib::ShellOut.new("yum list-security | grep -v 'Loaded' | grep -v 'mirror' | grep -v 'updateinfo' | awk \'{print$3}\'")
	  find.run_command
	  return find.stdout
	end


    def self.package_names_centos_sec
	  find = Mixlib::ShellOut.new("yum list-security | grep -v 'Loaded'| grep -v 'mirror' | grep -v 'updateinfo' | wc -l")
	  find.run_command
	  return find.stdout 
    end


	
#This is for getting the number of All patches and names of the ubuntu vms
	
	def self.package_names_ubuntu
	  find = Mixlib::ShellOut.new("apt list --upgradable | grep -v 'Listing' | grep upgradable |cut -d '/' -f1")
	  find.run_command
	  return find.stdout 
	end

	def self.number_packages_ubuntu
	  find = Mixlib::ShellOut.new("apt list --upgradable | grep -v 'Listing' | grep upgradable | wc -l")
	  find.run_command
	  return find.stdout 
	end
#This is for getting the number of security patches and names of the ubuntu vms
	def self.package_names_ubuntu_sec
	  find = Mixlib::ShellOut.new("apt list --upgradable | grep -i security | grep -v 'Listing'  | grep upgradable | cut -d '/' -f1")
	  find.run_command
	  return find.stdout 
	end

	def self.number_packages_ubuntu_sec
	  find = Mixlib::ShellOut.new("apt list --upgradable | grep -i security | grep -v 'Listing' | grep upgradable | wc -l")
	  find.run_command
	  return find.stdout 
	end

#This is for getting the number of All patches and names of the suse vms 
	def self.package_names_suse
	  find = Mixlib::ShellOut.new("zypper list-patches |grep SLE | awk \'{print$16}\'")
	  find.run_command
	  return find.stdout 
	end
	def self.number_packages_suse
	  find = Mixlib::ShellOut.new("zypper list-patches | grep SLE | wc -l")
	  find.run_command
	  return find.stdout 
	end

#This is for getting the number of security patches and names of the suse vms 
	def self.package_names_suse_sec
	  find = Mixlib::ShellOut.new("zypper list-patches --category security | grep SLE | awk \'{print$16}\'")
	  find.run_command
	  return find.stdout 
	end
	def self.number_packages_suse_sec
	  find = Mixlib::ShellOut.new("zypper list-patches --category security | grep SLE | wc -l")
	  find.run_command
	  return find.stdout 
	end
end