
node 'default' {
  
  if $hostname =~ /beowulf-master/ {
    include environment::master
  }
  else
  {
    include environment::slave
  }
  #include environment
  #include environment::master
  #include environment::slave
  
  #Required: 
  include mpi
}
