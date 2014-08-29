
==Install==
yum install -y http://yum.theforeman.org/nightly/el6/x86_64/foreman-release.rpm
yum -y localinstall http://mirror.pnl.gov/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install centos-release-SCL
yum -y install foreman-plugin-staypuft
yum -y install foreman-installer-staypuft
# echo /usr/share/foreman-installer/modules/foreman/manifests/remote_file.pp:6
mkdir /var/lib/tftpboot
mkdir /var/lib/tftpboot/boot
yum -y update
# echo modify iptables
cat /proc/sys/net/ipv4/ip_forward
# change net.ipv4.ip_forward from 0 to 1
vi /etc/sysctl.conf
sysctl -e -p /etc/sysctl.conf

vi /etc/hosts
192.168.2.151	foreman.hq.ltg	foreman

staypuft-installer --foreman-configure-epel-repo=true --foreman-plugin-discovery-install-images=true --foreman-admin-password="changeme"

iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
service iptables save
vi /etc/sysconfig/iptables
service iptables restart

Update Centos7 mirror to 
http://mirror.centos.org/centos/7/os/$arch

Modify /etc/sysconfig/named and add OPTION statement to force IPV4 instead of IPV6 of Centos7
OPTION="-4"

===
Openstack Default

 #Dynamic
cat <<EOF > /tmp/diskpart.cfg
zerombr
clearpart --all --initlabel
part /boot --fstype ext3 --size=500 --ondisk=sda
part swap --size=1024 --ondisk=sda
part pv.01 --size=1024 --grow --ondisk=sda
volgroup vg_root pv.01
logvol  /  --vgname=vg_root  --size=1 --grow --name=lv_root
EOF




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


