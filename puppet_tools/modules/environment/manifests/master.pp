class environment::master {
  include environment
  
  exec {"mpiuser-ownership":
    command => "sudo chown -R mpiuser:mpiuser /home/mpiuser",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    user => root,
    require => User ["mpiuser"],
  }
   
  #Create the working directories
  file { ["/home/mpiuser/bin/"]:
    ensure => "directory",
    owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => User["mpiuser"],
  }
  
#    #Create the working directories
#  file { ["/home/mpiuser/updates/"]:
#    ensure => "directory",
#    owner  => "mpiuser",
#    group  => "mpiuser",
#    mode   => "0755",
#    require => User["mpiuser"],
#  }
  
  # configure hte /etc/exports file to share the master's /home/mpidir dir  
  exec { "edit_etc-exports_file":
    command => "echo \"/home/mpiuser *(rw,sync,no_subtree_check)\" >> /etc/exports",
    unless => "sudo cat /etc/exports | grep \"^/home/mpiuser *(rw,sync,no_subtree_check)\"",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => Package["nfs-common"],
    notify => Service["nfs-kernel-server"], 
  }
  
#  exec { "copy_HostsNodes":
#    command => "cp /tmp/hosts_avahi /home/mpiuser/hosts",
#    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
#    user => root,
#    require => Exec ["getHostsFileOnce"],
#  }
    
  cron { "copy_AVAHI_files":
    command => "cp /tmp/hosts_hydra /home/mpiuser/hosts",
    user    => mpiuser,
    hour    => '*',
    minute  => '*/1',
    require => Exec["getHostsFileOnce"],
  }
  
  exec {"create-SSH-key":
    #command => "sudo -u mpiuser ssh-keygen -t rsa -f /home/mpiuser/.ssh/id_rsa -q -N \"\"",
    command => "ssh-keygen -t rsa -f /home/mpiuser/.ssh/id_rsa -q -N \"\"",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    user => mpiuser,
    creates => "/home/mpiuser/.ssh/id_rsa",
    cwd => "/home/mpiuser",
    require => User ["mpiuser"],
  }
  
  
  
#  exec {"create-authorized_keys":
#    command => "ssh-copy-id localhost",
#    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
#    user => mpiuser,
#    creates => "/home/mpiuser/.ssh/authorized_keys",
#    cwd => "/home/mpiuser",
#    require => Exec ["create-SSH-key"],
#  }
  
  
  
  
}