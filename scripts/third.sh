#!/bin/bash

# Configure Katello / Foreman
# Third Step
# Perform after Creating Views and such

# Administrative Tasks
# Allow Foreman-Proxy Node to be associated with our organization
# TFTP, DNS, DHCP, Puppet and Puppet CA

# Couldnt find a hammer parameter to do so. Pending.

echo Moved to environmnet_config.sh
#hammer -u admin -p changeme subnet create --name "Management Network" --network "10.10.10.0" --mask "255.255.255.0" --gateway "10.10.10.10" --dns-primary "10.10.10.10" --from "10.10.10.30" --to "10.10.10.50" --domain-ids 1 --dhcp-id 1 --dns-id 1 --tftp-id 1

#hammer -u admin -p changeme subnet create --name "Internal Network" --network "10.10.6.0" --mask "255.255.255.0" --gateway "10.10.6.10" --dns-primary "10.10.6.10" --from "10.10.6.30" --to "10.10.6.50" --domain-ids 1 --dhcp-id 1 --dns-id 1 --tftp-id 1

echo Pending:
echo edit /pxelinux.cfg/config to the following script: (Update URL)
echo GUI: Adminstration -> Settings -> Discovered and update the discovery_organization with the Organization name you are using (Test_Cloud7)
echo GUI: excute Create PXE Image
echo Modify /etc/foreman-proxy/settings.yml changing dns_key to false 


