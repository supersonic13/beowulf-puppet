class environment::nfs {
  #Install NFS  
  package { ['nfs-kernel-server']: ensure => present, }
  package { ['nfs-common']: 
    ensure => present,
    require => Package['nfs-kernel-server'], 
  }
  
}