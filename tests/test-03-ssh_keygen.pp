# simple package install

file { '/tmp/george/.ssh' :
  ensure  => 'directory',
}->
ssh_keygen { 'george' :
  home  => '/tmp/george',
}
