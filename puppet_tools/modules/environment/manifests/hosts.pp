class environment::hosts {
  
#  file {"copy_hosts":
#    path => "/etc/hosts",
#    ensure  => file,
#    source  => "puppet:///modules/environment/hosts",
#    mode    => "0644",
#    owner => "root",
#  }
  
  package {"avahi-daemon": ensure => present,}
  package {"avahi-discover": ensure => present,}
  package {"avahi-utils": ensure => present,}
  
  
  file {"copy_update_hosts_file":
    path => "/usr/local/bin/updateHostsFile.sh",
    ensure  => file,
    source  => "puppet:///modules/environment/updateHostsFile.sh",
    mode    => "0755",
    owner => "root",	      
  }
  
  cron { "cron_hostsfile":
	  command => "/usr/local/bin/updateHostsFile.sh",
	  user    => root,
	  hour    => '*/1',
	  minute  => '*/1',
	}
  
  #avahi-browse --all -r -t -p | egrep "^[=]" | grep "node" | awk -F";" '{print $7" "$8}' | egrep "[0-9]+.[0-9]+.[0-9]+.[0-9]+"

}