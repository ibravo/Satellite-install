#!/bin/bash

# Configure Katello / Foreman
# Add LTG Username


# Add Organization
hammer -u admin -p changeme organization create --name Test_Cloud7 --description "Cloud Servers in VM internal network"

# Add Environments
# Library -> Test -> Prod
hammer -u admin -p changeme lifecycle-environment create --description Testing --name Test --organization Test_Cloud7 --prior Library
hammer -u admin -p changeme lifecycle-environment create --description Production --name Prod --organization Test_Cloud7 --prior Test
# Check Install
hammer -u admin -p changeme organization info --name Test_Cloud7
hammer -u admin -p changeme lifecycle-environment list --organization Test_Cloud7

# Add Products
# Puppet
hammer -u admin -p changeme product create --description "Puppet RPMS Repos" --name Puppet --organization Test_Cloud7
# CentOS
hammer -u admin -p changeme product create --description "CentOS Repos" --name CentOS --organization Test_Cloud7
# Foreman
hammer -u admin -p changeme product create --description "Foreman Repos" --name Foreman --organization Test_Cloud7
# Check Install
hammer -u admin -p changeme product list --organization Test_Cloud7

# Add Repos to Products
# Puppet
hammer -u admin -p changeme repository create --organization Test_Cloud7 --content-type yum --name  "Puppet el 6.5 x86_64"  --product Puppet --publish-via-http true --url "http://yum.puppetlabs.com/el/6.5/products/x86_64" 
# CentOS
hammer -u admin -p changeme repository create --organization Test_Cloud7 --content-type yum --name  "Centos 6 x86_64"  --product Centos --publish-via-http true --url "http://mirror.centos.org/centos/6/os/x86_64" 
hammer -u admin -p changeme repository create --organization Test_Cloud7 --content-type yum --name  "Centos 6 i386"  --product Centos --publish-via-http true --url "http://mirror.centos.org/centos/6/os/i386" 
# Foreman
hammer -u admin -p changeme repository create --organization Test_Cloud7 --content-type yum --name  "Foreman Nightly"  --product Foreman --publish-via-http true --url "http://yum.theforeman.org/nightly/el6/x86_64/"

# Create Sync Plan
hammer -u admin -p changeme sync-plan create --description "Daily Sync 03:00 AM" --interval daily --name "Daily 3A" --sync-date "2014-05-01 03:00:00" --organization Test_Cloud7

# Assign Sync Plan to Products
hammer -u admin -p changeme product set-sync-plan --name Puppet --organization Test_Cloud7 --sync-plan-id 1
hammer -u admin -p changeme product set-sync-plan --name CentOS --organization Test_Cloud7 --sync-plan-id 1
hammer -u admin -p changeme product set-sync-plan --name Foreman --organization Test_Cloud7 --sync-plan-id 1

# Syncrhonize the repositories
echo Sync Puppet
hammer -u admin -p changeme repository synchronize --async --id 1
echo Sync CentOS i386
hammer -u admin -p changeme repository synchronize --async --id 2
echo Sync CentOS x86
hammer -u admin -p changeme repository synchronize --async --id 3
echo Sync Foreman
hammer -u admin -p changeme repository synchronize --async --id 4

# Add Content Views
echo Puppet Content View
hammer -u admin -p changeme content-view create --description "Puppet View" --name "Puppet" --organization Test_Cloud7 --repository-ids 1
echo CentOS Content View
hammer -u admin -p changeme content-view create --description "CentOS Base View" --name "CentOS Base" --organization Test_Cloud7 --repository-ids 2,3
echo Foreman Content view
hammer -u admin -p changeme content-view create --description "Foreman View" --name "Foreman" --organization Test_Cloud7 --repository-ids 4





