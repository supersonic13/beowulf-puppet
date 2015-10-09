
node 'default' {
  # To create logrunner user and the working directories;
  # Disable if runnign on the live server as the users and the paths are already present;
  include environment    
  
  #Required: 
  include mpi
#  include httpserver
#  include log_analyser

}
