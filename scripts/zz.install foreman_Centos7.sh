=========================
CentOS 6 1.6
-------------------------
cat << EOF >> /etc/hosts
192.168.1.19 puppet6.miwcasa puppet6
EOF


#yum install -y http://yum.theforeman.org/releases/1.7/el6/x86_64/foreman-release.rpm
yum install -y http://yum.theforeman.org/releases/1.6/el6/x86_64/foreman-release.rpm
yum -y localinstall http://mirror.pnl.gov/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install centos-release-SCL

# Add the puppet repo
yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install foreman-installer
yum -y update

# Set Selinux permissive
cat << EOF > /etc/sysconfig/selinux
SELINUX=permissive
EOF




foreman-installer \
--enable-foreman \
--enable-foreman-compute-ec2 \
--enable-foreman-compute-libvirt \
--enable-foreman-compute-openstack \
--enable-foreman-compute-ovirt \
--enable-foreman-compute-vmware \
--enable-foreman-proxy \
--foreman-configure-epel-repo \
--foreman-unattended \
--foreman-proxy-dhcp=true \
--foreman-proxy-dhcp-gateway="10.10.10.6" \
--foreman-proxy-dhcp-interface="eth1" \
--foreman-proxy-dhcp-range="10.10.10.100 10.10.10.200" \
--foreman-proxy-tftp=true \
--foreman-proxy-tftp-servername="10.10.10.6" \
--foreman-proxy-dns=true \
--foreman-proxy-dns-forwarders "10.10.10.6" \
--foreman-proxy-dns-interface="eth1" \
--foreman-proxy-dns-managed=true \
--foreman-proxy-dns-reverse="10.10.10.in-addr.arpa" \
--foreman-proxy-dns-zone="miwcasa" \
--enable-foreman-plugin-discovery \
--foreman-plugin-discovery-install-images=true \
--foreman-admin-password="changeme" 

=========================
CentOS 7
-------------------------

cat << EOF >> /etc/hosts
192.168.1.20 puppet7.miwcasa puppet7
EOF

yum install -y http://yum.theforeman.org/releases/1.7/el7/x86_64/foreman-release-1.7.0-0.1.RC1.el7.noarch.rpm
yum install -y epel-release
yum -y --nogpgcheck install foreman-release-scl

# Add the puppet repo
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y install foreman-installer
yum -y update

# Set Selinux permissive
cat << EOF > /etc/sysconfig/selinux
SELINUX=permissive
EOF


foreman-installer \
--enable-foreman \
--enable-foreman-compute-ec2 \
--enable-foreman-compute-libvirt \
--enable-foreman-compute-openstack \
--enable-foreman-compute-ovirt \
--enable-foreman-compute-vmware \
--enable-foreman-proxy \
--foreman-configure-epel-repo \
--foreman-unattended \
--foreman-proxy-dhcp=true \
--foreman-proxy-dhcp-gateway="10.10.10.7" \
--foreman-proxy-dhcp-interface="enp0s8" \
--foreman-proxy-dhcp-range="10.10.10.100 10.10.10.200" \
--foreman-proxy-tftp=true \
--foreman-proxy-tftp-servername="10.10.10.7" \
--foreman-proxy-dns=true \
--foreman-proxy-dns-forwarders "10.10.10.7" \
--foreman-proxy-dns-interface="enp0s8" \
--foreman-proxy-dns-managed=true \
--foreman-proxy-dns-reverse="10.10.10.in-addr.arpa" \
--foreman-proxy-dns-zone="miwcasa" \
--enable-foreman-plugin-discovery \
--foreman-plugin-discovery-install-images=true \
--foreman-admin-password="changeme" 


