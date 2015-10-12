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
 #   owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => Group ["mpiuser"],
  }  
  
  #Ensure the user 'mpiuser' is present
  user { "mpiuser":
    #name => "mpiuser",
    ensure  => present,
    #password => generate('/bin/bash', '-c', "mkpasswd -m sha-512 mpiuser"),
    password => '$6$Z7.bTQa5LNoyqyg3$79OD12Tv7qOJa3rZC7rNmZbEdgsaxl5Sd0bUZ8SGXNuTHL2BP0fW1VTFwYEF698lB4Rzm1IgO6Z9kt8UU5RqY0',
    gid     => "mpiuser",
    groups => ["sudo"],    
    uid => 999,
    home => "/home/mpiuser", 
    require => File ["/home/mpiuser"],
  } 

}