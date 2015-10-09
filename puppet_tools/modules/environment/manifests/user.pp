class environment::user {

   #Ensure the groups are present 
  group { ["mpiuser"]:
    ensure => present,
  }
  
  #Create the user directories
  file { ["/home/mpiuser"]:
    ensure => "directory",
    #owner  => "mpiuser",
    #group  => "mpiuser",
    mode   => "0755",
  }  
  
  #Ensure the user 'mpiuser' is present
  user { "mpiuser":
    ensure  => present,
    password => "mpiuser",
    gid     => "mpiuser",
    groups => ["sudo"], #other groups logrunner belongs to    
    uid => 999,
    home => "/home/mpiuser", 
  }
  
  #Create the working directories
  file { ["/home/mpiuser/bin/"]:
    ensure => "directory",
    owner  => "mpiuser",
    group  => "mpiuser",
    mode   => "0755",
    require => User["mpiuser"],
  }
  
}