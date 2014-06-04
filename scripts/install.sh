#!/bin/bash

# Start with a fresh install of CentOS
yum install -y git ruby rubygems
git clone https://github.com/Katello/katello-deploy.git
cd katello-deploy
yum -y localinstall http://repos.fedorapeople.org/repos/mcpierce/qpid-cpp/epel-6/noarch/qpid-cpp-release-6-1.el6.noarch.rpm
cp scl.repo /etc/yum.repos.d/scl.repo
yum -y localinstall http://yum.theforeman.org/nightly/el6/x86_64/foreman-release.rpm
yum -y install foreman-selinux
./setup.rb centos6 --skip-installer
service iptables stop

katello-installer --foreman-authentication=true --capsule-tftp=true --capsule-tftp-servername="192.168.2.150" --capsule-dhcp=true --capsule-dhcp-gateway="10.10.10.10" --capsule-dhcp-interface="eth1" --capsule-dhcp-range="10.10.10.20 10.10.10.200" --capsule-dns=true --capsule-dns-forwarders "8.8.8.8" --capsule-dns-interface="eth1" --capsule-dns-zone "hq.ltg" 
# katello-installer --foreman-authentication=true --capsule-tftp=true --capsule-tftp-servername="192.168.2.150" --capsule-dhcp=true --capsule-dhcp-gateway="10.10.10.10" --capsule-dhcp-interface="eth1" --capsule-dhcp-range="10.10.10.20 10.10.10.200" --capsule-dns=true --capsule-dns-forwarders "8.8.8.8" --capsule-dns-interface="eth1" --capsule-dns-reverse="10.10.10.in-addr.arpa" -v
# katello-installer --foreman-authentication=true --capsule-tftp=true --capsule-tftp-servername="192.168.2.150" --capsule-dhcp=true --capsule-dhcp-gateway="10.10.10.10" --capsule-dhcp-interface="eth1" --capsule-dhcp-range="10.10.10.20 10.10.10.200" -v
 
## Pending items
echo Change SELINUX=permissive with 'vim /etc/selinux/config'
echo vim /etc/hosts and add FQDN to list

