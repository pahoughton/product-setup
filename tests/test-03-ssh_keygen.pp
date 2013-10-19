# simple package install

file { '/tmp/george/.ssh' :
  ensure  => 'directory',
  recurse => true,
}->
ssh_keygen { 'george' :
  home    => '/tmp/george',
}
