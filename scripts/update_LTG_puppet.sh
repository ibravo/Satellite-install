echo "Cloning repositories"
git clone https://github.com/ibravo/astapor.git
git clone https://github.com/ibravo/ltgcloud.git
git clone https://github.com/ibravo/puppet-ceph.git
git clone --recursive https://github.com/redhat-openstack/openstack-puppet-modules

echo "Copying from repo to foreman directory"
mkdir modules
mkdir modules/ceph

mv astapor/puppet/modules/* modules
mv openstack-puppet-modules/* modules
mv puppet-ceph/* modules/ceph
mv ltgcloud/modules/* modules

\cp -a ./modules/* /etc/puppet/environments/production/modules/

echo "removing temp files"
rm -rf astapor
rm -rf openstack-puppet-modules
rm -rf ltgcloud
rm -rf puppet-ceph
rm -rf modules

echo "Now you should refresh the available modules in formena or use Hammer to do so"



