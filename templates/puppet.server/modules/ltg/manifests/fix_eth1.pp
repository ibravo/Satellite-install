# To update eth1 to a particular IP
class ltg::fix_eth1 (
      $device  = "eth1",
      $net     = "10",
      $netmask = "255.255.255.0",
      $up      = true,
      ) {

 $iptwo = inline_template('<%= @ipaddress_eth0.sub(/(\d+)\.(\d+)$/,@net+".\\2") %>')
 

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
	"set IPADDR $iptwo",
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
      command => "/sbin/ifdown $device; /sbin/ifup $device",
      unless  => "/sbin/ifconfig | grep $iptwo",
      require => Augeas["main-$device"],
    }
  } else {
    exec {"ifdown-$device":
      command => "/sbin/ifconfig $device down",
      onlyif  => "/sbin/ifconfig | grep $device",
    }
  }
}

