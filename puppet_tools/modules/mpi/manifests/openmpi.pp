class mpi::openmpi {
  
  package { ['openmpi-bin']: ensure => present}
  package { ['openmpi-common']: ensure => present}
  
}