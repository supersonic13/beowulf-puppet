class mpich{
  package { ['mpich2']: ensure => present, }
  
#  package { ['openmpi-common']: ensure => present, require => Package['mpich2'],}
  
}