
node 'default' {
  
  #include environment
  #include environment::master
  #include environment::slave
  
  #Required: 
  include mpi
}
