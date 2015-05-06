# Class: glusterfs::server
#
# Gluster Client
# 1. Verify that GlusterFS package is installed
# 2. Create mount point
# 3. Mount!
#
# Parameters:
#  $peers:
#    Array of peer IP addresses to be added. Default: empty
#
# Sample Usage :
#  class { 'glusterfs::server':
#    peers => $::hostname ? {
#      'server1' => '192.168.0.2',
#      'server2' => '192.168.0.1',
#    },
#  }
#
class glusterib::client (
  $peers = []
) {

  # Main package and service it provides
  package { 'glusterfs': ensure => installed }
#  service { 'glusterd':
#    enable    => true,
#    ensure    => running,
#    hasstatus => true,
#    require   => Package['glusterfs'],
#  }

##########
#  Other packages
#  package { 'glusterfs':
#    ensure  => 'installed',
#  }
  package { 'glusterfs-fuse':
    ensure  => 'installed',
  }
  package { 'glusterfs-rdma':
    ensure  => 'installed',
  }
  package { 'fuse':
    ensure  => 'installed',
  }
  package { 'fuse-libs':
    ensure  => 'installed',
  }

  # Mounts
  exec{'/bin/mkdir -p /mount/gglance':
        unless => '/usr/bin/test -d /mount/gglance',
  }
  exec{'/bin/mkdir -p /mount/gswift':
        unless => '/usr/bin/test -d /mount/gswift',
  }
  exec{'/bin/mkdir -p /mount/gcinder':
        unless => '/usr/bin/test -d /mount/gcinder',
  }
    mount{'mount gcinder':
        name => '/mount/gcinder',
        atboot => true,
        ensure => mounted,
        device => 'labsrv05:/gcinder',
        fstype => 'glusterfs',
        options => "defaults,_netdev",
	dump    => '0',
	pass    => '0'
  }
  mount{'mount gglance':
	name => '/mount/gglance',
	atboot => true,
	ensure => mounted,
	device => 'labsrv05:/gglance',
	fstype => 'glusterfs',
	options => "defaults,_netdev",
	dump	=> '0',
	pass	=> '0'
  }
  mount{'mount gswift':
        name => '/mount/gswift',
        atboot => true,
        ensure => mounted,
        device => 'labsrv05:/gswift',
        fstype => 'glusterfs',
        options => "defaults,_netdev",
	dump	=> '0',
	pass	=> '0'
  }

}



