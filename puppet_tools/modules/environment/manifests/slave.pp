class environment::slave {
  include environment
  
  exec { "mount-master-home-dir":
    command => "mount $MASTER_IPADDRESS:/home/mpiuser /home/mpiuser",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => Package["nfs-common"], 
  }
  
}