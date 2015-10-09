class environment {
  include environment::customuser
  include environment::common
  include environment::nfs
  include environment::hosts

  
  #TODO: ADD TO HOSTS FILE ?
}
