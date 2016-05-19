echo ##########  Install Webmin  #############
echo yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
echo yum -y localinstall http://prdownloads.sourceforge.net/webadmin/webmin-1.791-1.noarch.rpm



echo ######  Install Katello  ##########
echo DEV
#yum -y install epel-release
#yum -y localinstall http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
#yum -y localinstall http://fedorapeople.org/groups/katello/releases/yum/3.0/katello/RHEL/7Server/x86_64/katello-repos-latest.rpm
#yum -y localinstall http://yum.theforeman.org/nightly/el7/x86_64/foreman-release.rpm
#yum -y install http://yum.theforeman.org/releases/1.11/el7/x86_64/foreman-release.rpm
#yum -y install foreman-release-scl

echo PRODUCTION Install
yum -y install epel-release
yum -y localinstall http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y install epel-release http://yum.theforeman.org/releases/1.11/el7/x86_64/foreman-release.rpm
yum -y install foreman-installer
