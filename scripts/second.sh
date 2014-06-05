#!/bin/bash

# Configure Katello / Foreman
# Add LTG Username


echo "$(date) Start Software Configuration" >> /root/Sat.install.log
# Add Organization
# Add Repos to Products
echo "$(date) Start Defining Repos" >> /root/Sat.install.log
# Puppet
echo "$(date) Start Repo Synch" >> /root/Sat.install.log
echo "$(date)   Sync Puppet" >> /root/Sat.install.log
echo Sync Puppet
echo "$(date)   Sync CentOS i386" >> /root/Sat.install.log
echo Sync CentOS i386
echo "$(date)   Sync CentOS x86" >> /root/Sat.install.log
echo Sync CentOS x86
echo "$(date)   Sync Foreman" >> /root/Sat.install.log
echo Sync Foreman
echo "$(date) Start View Creation" >> /root/Sat.install.log
echo Puppet Content View
echo CentOS Content View
echo Foreman Content view
echo "$(date) Start Publish Views" >> /root/Sat.install.log
echo Puppet Content View Publish version 1
echo CentOS Content View Publish version 1
echo Foreman Content view Publish version 1
echo Puppet View -> Test -> Prod
echo "$(date) Start PXE Linux Download" >> /root/Sat.install.log
echo "$(date) Finish Configuration" >> /root/Sat.install.log
echo "-------------" >> /root/Sat.install.log





