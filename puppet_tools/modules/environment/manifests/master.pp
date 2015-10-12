class environment::master {
  include environment
   
  #Create the working directories
  file { ["/home/mpiuser/bin/"]:
    ensure => "directory",
    owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => User["mpiuser"],
  }
  
    #Create the working directories
  file { ["/home/mpiuser/updates/"]:
    ensure => "directory",
    owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => User["mpiuser"],
  }
  
  # configure hte /etc/exports file to share the master's /home/mpidir dir  
  exec { "edit_etc-exports_file":
    command => "echo \"/home/mpiuser *(rw,sync,no_subtree_check)\" >> /etc/exports",
    unless => "sudo cat /etc/exports | grep \"^/home/mpiuser *(rw,sync,no_subtree_check)\"",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => Package["nfs-common"],
    notify => Service["nfs-kernel-server"], 
  }
  
}