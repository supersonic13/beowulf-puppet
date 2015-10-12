class mpi::mpich2 {
  
  package { ['mpich2']: ensure => present, }
  
  if $hostname =~ /beowulf-master/ {
    #include mpi::master
    
    exec {"download-mpich-tar":
      command => "wget http://www.mpich.org/static/downloads/3.0.4/mpich-3.0.4.tar.gz",
      path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
      cwd => "/home/vagrant",
      user => vagrant,
      require => Package ["mpich2"],
    }
    
    exec {"untar-mpich":
      command => "tar xvf mpich-3.0.4.tar.gz",
      path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
      cwd => "/home/vagrant",
      user => vagrant,
      require => Exec ["download-mpich-tar"],
    }
    
    exec {"configure-mpich":
      command => "/home/vagrant/mpich-3.0.4/configure",
      path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
      cwd => "/home/vagrant/mpich-3.0.4",
      user => vagrant,
      require => Exec ["untar-mpich"],
    }
    
    exec {"make-mpich":
      command => "make",
      path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
      cwd => "/home/vagrant/mpich-3.0.4",
      user => vagrant,
      require => Exec ["configure-mpich"],
    }
    
    
  }
}