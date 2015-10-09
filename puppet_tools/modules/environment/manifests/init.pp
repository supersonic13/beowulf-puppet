class environment {
  
  #Ensure the user 'mpiuser' is present
  user { "mpiuser":
    ensure  => present,
    gid     => "mpiuser",
    uid => 999, 
  }
    
  #Create the working directories
  file { ["/home/mpiuser/bin/"]:
    ensure => "directory",
    owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => User["mpiuser"],
  }
  
  exec {"add-to-sudoers":
    command => "adduser mpiuser sudo",
    path => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => User["mpiuser"],
  }  
  
  package { ['nfs-kernel-server']: ensure => present, }
  package { ['nfs-common']: 
    ensure => present,
    require => Package['nfs-kernel-server'], 
  }
  
  exec {"mpiuser-dir-permissions":
    command => "sudo chown mpiuser:mpiuser /home/mpiuser",
    path => "", 
  }
  
  #If master, do nothing, else install the HOSTS file found
  exec {"mount-nfs":
    command => "sudo mount master:/home/mpiuser /home/mpiuser",
    path => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
  }  

  
  
  #TODO: ADD TO HOSTS FILE ?
}
