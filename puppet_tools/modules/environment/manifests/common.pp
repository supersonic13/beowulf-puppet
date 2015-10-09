class environment::common {
  
  #Install iwatch to monitor for updates in any directory
  package { ['iwatch']: ensure => present, }
  
  file { 'copy_iwatch_config':
    path    => "/tmp/iwatch_config.xml",
    ensure  => file,
    source  => "puppet:///modules/environment/iwatch_config.xml",
    #owner   => "root",
    #group   => "apache",
    mode    => "0755",
  }
  
  file { 'copy_checkForDirUpdates':
    path    => "/usr/local/bin/checkForDirUpdates.sh",
    ensure  => file,
    source  => "puppet:///modules/environment/checkForDirUpdates.sh",
    mode    => "0755",
    owner => "mpiuser",
  }
  
  exec {"run_iwatch_daemon":
    command => "iwatch -d -f /tmp/iwatch_config.xml",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => File["copy_iwatch_config"],
    user => "root",
  }
  
}