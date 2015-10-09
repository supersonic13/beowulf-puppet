
node 'default' {
  
  $MY_LOCAL_IP=$::ipaddress_eth1
  $MASTER_IPADDRESS="192.168.104.214"
  
  # To create logrunner user and the working directories;
  # Disable if runnign on the live server as the users and the paths are already present;
  include environment::master
  
  #Required: 
  include mpi
}
