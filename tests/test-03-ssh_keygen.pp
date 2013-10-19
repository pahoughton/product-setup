# simple package install

file { '/tmp/george' :
  ensure  => 'directory',
}->
ssh_keygen { 'george' :
  home  => '/tmp/george',
}
