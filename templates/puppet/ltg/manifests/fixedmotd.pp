
class ltg::fixedmotd (
  $set_motd    = "#########################################\n            LTG Systems.\nUse under strict supervision from Jay,\n            the PuppetMaster\n##########################################\n",
) {

	file {'motd':
		path 	=> '/etc/motd',
		ensure 	=> present,
		source  => 'puppet:///modules/ltg/fixedmotd.txt',
		#content => $set_motd,
	}

}
