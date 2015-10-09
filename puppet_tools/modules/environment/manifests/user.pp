class environment::customuser {

  package {"whois":
    ensure  => present,
  }

  #$password = "mpiuser"
   #Ensure the groups are present 
  group {"mpiuser":
    ensure => present,
    require => Package["whois"],
  }
  
  #Create the user directories
  file { "/home/mpiuser":
    ensure => "directory",
    #owner  => "mpiuser",
    #group  => "mpiuser",
    mode   => "0755",
    require => Group ["mpiuser"],
  }  
  
  #Ensure the user 'mpiuser' is present
  user { "mpiuser":
    #name => "mpiuser",
    ensure  => present,
  #  password => generate('/bin/bash', '-c', "mkpasswd -m sha-512 mpiuser"),
    gid     => "mpiuser",
    groups => ["sudo"],    
    uid => 999,
    home => "/home/mpiuser", 
    require => File ["/home/mpiuser"],
  } 

}