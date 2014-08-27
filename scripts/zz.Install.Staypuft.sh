

==Install==
yum install -y http://yum.theforeman.org/nightly/el6/x86_64/foreman-release.rpm
yum -y localinstall http://mirror.pnl.gov/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install centos-release-SCL
yum -y install foreman-plugin-staypuft
yum -y install foreman-installer-staypuft
# echo /usr/share/foreman-installer/modules/foreman/manifests/remote_file.pp:6
mkdir /var/lib/tftpboot
mkdir /var/lib/tftpboot/boot
# echo now modify the file: /opt/rh/ruby193/root/usr/share/gems/gems/staypuft-0.1.20/app/models/staypuft/deployment.rb

staypuft-installer --foreman-configure-epel-repo=true --foreman-plugin-discovery-install-images=true 


==============
Line 277 aprox of file app/models/staypuft/deployment.rb

    def update_operating_system
      name = Setting[:base_hostgroup].include?('RedHat') ? 'RedHat' : 'CentOS'
      self.hostgroup.operatingsystem = case platform
                                       when Platform::RHEL6
                                         Operatingsystem.where(name: name, major: '6', minor: '5').first
                                       when Platform::RHEL7
                                         Operatingsystem.where(name: name, major: '7', minor: '0').first
                                       end or
          raise 'missing Operatingsystem'


