staypuft-installer --foreman-configure-epel-repo=true --foreman-plugin-discovery-install-images=true --foreman-admin-password="changeme"


katello-installer --foreman-admin-password="changeme" --foreman-authentication=true --capsule-tftp=true --capsule-tftp-servername="10.10.10.10" --capsule-dhcp=true --capsule-dhcp-gateway="10.10.10.10" --capsule-dhcp-interface="eth1" --capsule-dhcp-range="10.10.10.20 10.10.10.200" --capsule-dns=true --capsule-dns-forwarders "10.10.10.10" --capsule-dns-interface="eth1" --capsule-dns-reverse="10.10.10.in-addr.arpa" --capsule-dns-zone "hq.ltg" 



================
yum install -y http://yum.theforeman.org/nightly/el6/x86_64/foreman-release.rpm
yum -y localinstall http://mirror.pnl.gov/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install centos-release-SCL
yum -y localinstall http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y foreman-installer
yum -y update


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
--foreman-proxy-dhcp-gateway="10.10.10.10" \
--foreman-proxy-dhcp-interface="eth1" \
--foreman-proxy-dhcp-range="10.10.10.20 10.10.10.200" \
--foreman-proxy-tftp=true \
--foreman-proxy-tftp-servername="10.10.10.10" \
--foreman-proxy-dns=true \
--foreman-proxy-dns-forwarders "10.10.10.10" \
--foreman-proxy-dns-interface="eth1" \
--foreman-proxy-dns-managed=true \
--foreman-proxy-dns-reverse="10.10.10.in-addr.arpa" \
--foreman-proxy-dns-zone="hq.ltg" \
--enable-foreman-plugin-discovery \
--foreman-plugin-discovery-install-images=true


--foreman-proxy-puppetca
--foreman-proxy-puppetrun
--foreman-proxy-register-in-foreman
--puppet-server

