require 'mixlib/shellout'
 class Helper_install


  def self.get_centos_wget
    find = Mixlib::ShellOut.new("yum install wget -y ")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

 def self.get_centos_package 
    find = Mixlib::ShellOut.new("wget http://dl.fedoraproject.org/pub/epel/6/x86_64/sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

  def self.get_centos_rpm
    find = Mixlib::ShellOut.new("rpm -ivh sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

  def self.get_centos_ssh
    find = Mixlib::ShellOut.new("yum install sshpass -y ")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end


  def self.get_redhat_wget
    find = Mixlib::ShellOut.new("yum install wget -y ")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

  def self.get_redhat_package 
    find = Mixlib::ShellOut.new("wget http://dl.fedoraproject.org/pub/epel/6/x86_64/sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

  def self.get_redhat_rpm
    find = Mixlib::ShellOut.new("rpm -ivh sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end
  
  def self.get_redhat_ssh
    find = Mixlib::ShellOut.new("yum install sshpass -y ")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end



  def self.get_suse_wget
    find = Mixlib::ShellOut.new("zypper install wget -y")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

  def self.get_suse_package
    find = Mixlib::ShellOut.new("wget http://dl.fedoraproject.org/pub/epel/6/x86_64/sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end
  def self.get_suse_rpm
    find = Mixlib::ShellOut.new("rpm -ivh sshpass-1.05-1.el6.x86_64.rpm")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end
  def self.get_suse_ssh
    find = Mixlib::ShellOut.new("zypper install sshpass -y ")
    find.run_command
    Chef::Log.info("#{find.stdout}")
  end

end