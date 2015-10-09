
node 'default' {
  
  $MY_LOCAL_IP=$::ipaddress_eth1
  $MASTER_IPADDRESS="192.168.104.214"
  
  include environment
  #include environment::master
  #include environment::slave
  
  #Required: 
  include mpi
}
