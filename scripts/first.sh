#!/bin/bash

# Start with a fresh install of CentOS
echo "-------------" >> /root/Sat.install.log
echo "$(date) Start Install git" >> /root/Sat.install.log

git clone https://github.com/Katello/katello-deploy.git
cd katello-deploy

echo "$(date) Start Install foreman-selinux" >> /root/Sat.install.log


echo "$(date) Start Katello Package Download" >> /root/Sat.install.log
./setup.rb centos6 --skip-installer

echo "$(date) Start Katello Installer" >> /root/Sat.install.log


echo "$(date) Finish Software Install" >> /root/Sat.install.log

sh ./second.sh
