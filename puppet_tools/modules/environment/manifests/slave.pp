class environment::slave {
  include environment

  
  exec { "mount-master-home-dir":
    command => "mount beowulf-master:/home/mpiuser /home/mpiuser",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => [Exec["getHostsFileOnce"], User["mpiuser"],], 
  }
  
  exec {"updateFSTab":
    command => "echo \"beowulf-master:/home/mpiuser /home/mpiuser nfs\" >> /etc/fstab",
    unless => "cat /etc/exports | grep \"^beowulf-master:/home/mpiuser /home/mpiuser nfs\"",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => Exec["mount-master-home-dir"],
  }
}