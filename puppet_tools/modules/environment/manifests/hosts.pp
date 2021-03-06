class environment::hosts {
  
#  file {"copy_hosts":
#    path => "/etc/hosts",
#    ensure  => file,
#    source  => "puppet:///modules/environment/hosts",
#    mode    => "0644",
#    owner => "root",
#  }
  
  package {"avahi-daemon": ensure => present,}
  package {"avahi-discover": ensure => present, require => Package["avahi-daemon"],}
  package {"avahi-utils": ensure => present, require => Package["avahi-discover"],}
  
  
  file {"copy_update_hosts_file":
    path => "/usr/local/bin/updateHostsFile.sh",
    ensure  => file,
    source  => "puppet:///modules/environment/updateHostsFile.sh",
    mode    => "0755",
    owner => "root",
    require => Package["avahi-utils"]	      
  }
  
  cron { "cron_hostsfile":
	  command => "/usr/local/bin/updateHostsFile.sh",
	  user    => root,
	  hour    => '*',
	  minute  => '*/1',
	  require => File["copy_update_hosts_file"],
	}
	
  exec { "getHostsFileOnce":
    command => "/usr/local/bin/updateHostsFile.sh $hostname",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => [Package["nfs-common"], File["copy_update_hosts_file"],],
    user => root,
  }

}