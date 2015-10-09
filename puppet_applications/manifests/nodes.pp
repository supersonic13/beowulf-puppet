
node 'default' {
  # To create logrunner user and the working directories;
  # Disable if runnign on the live server as the users and the paths are already present;
  include environment    
  
  #Required: The the analyser code in /opt/apps/log_analyser/repo/source_log-analyser/
#  include database
#  include httpserver
#  include log_analyser

}
