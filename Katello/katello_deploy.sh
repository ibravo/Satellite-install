echo "Installs but without discovery and DHCP"
echo foreman-installer --scenario katello --enable-foreman-plugin-discovery --foreman-admin-password="changeme" --foreman-initial-location="McLean" --foreman-initial-organization="LTG_Federal" --foreman-proxy-bmc 

echo "Installs with DHCP"
foreman-installer --scenario katello --enable-foreman-plugin-bootdisk --enable-foreman-plugin-default-hostgroup --enable-foreman-plugin-puppetdb --enable-foreman-plugin-discovery --foreman-admin-password="changeme" --foreman-initial-location="McLean" --foreman-initial-organization="LTG_Federal" --foreman-proxy-bmc true --foreman-proxy-dhcp true --foreman-proxy-tftp true --foreman-plugin-discovery-install-images

