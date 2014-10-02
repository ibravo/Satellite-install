# Class: glusterfs::server
#
# GlusterFS Server.
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
class glusterib::server (
  $peers = []
) {

  # Main package and service it provides
  package { 'glusterfs-server': ensure => installed }
  service { 'glusterd':
    enable    => true,
    ensure    => running,
    hasstatus => true,
    require   => Package['glusterfs-server'],
  }

##########
#  Other packages
#  package { 'glusterfs':
#    ensure  => 'installed',
#  }
#  package { 'glusterfs-fuse':
#    ensure  => 'installed',
#  }

  # Peers
  glusterfs::peer { $peers: }

}


