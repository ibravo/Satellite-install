# Class ltg::managed_interface
# Usage:
# 
#   managed_interface{"eth1":
#      device  => "eth1",
#      ipaddr  => "192.168.10.104",
#      netmask => "255.255.255.0",
#      hwaddr  => "00:1d:09:fa:93:6a",
#      up      => true,
#     }

define managed_interface($device , $ipaddr, $netmask, $up=true, $network="", $hwaddr="",$gateway="" ) {
  if ($up) {
      $onBoot = "yes"
  } else {
      $onBoot = "no"
  }

  augeas {"main-$device":
     context => "/files/etc/sysconfig/network-scripts/ifcfg-$device",
     changes => [
	"set DEVICE $device",
	"set BOOTPROTO none",
	"set ONBOOT $onBoot",
	"set NETMASK $netmask",
	"set IPADDR $ipaddr",
	],
  }
  if ($hwaddr!="") {
            augeas { "mac-$device":
                context => "/files/etc/sysconfig/network-scripts/ifcfg-$device",
                changes => [
                    "set HWADDR $hwaddr",
                ],
            }
  }

  if ($gateway!="") {
            augeas { "gateway-$device":
                context => "/files/etc/sysconfig/network",
                changes => [
                    "set GATEWAY $gateway",
                ],
            }
  }

  if $up {
    exec {"ifup-$device":
      command => "/sbin/ifup $device",
      unless  => "/sbin/ifconfig | grep $device",
      require => Augeas["main-$device"],
    }
  } else {
    exec {"ifdown-$device":
      command => "/sbin/ifconfig $device down",
      onlyif  => "/sbin/ifconfig | grep $device",
    }
  }
}

