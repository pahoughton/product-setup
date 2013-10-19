# test-03-ssh_keygen.pp - 2013-10-18 07:15
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
# recurse not working on osx

file { '/tmp/george' :
  ensure  => 'directory',
}->
file { '/tmp/george/.ssh' :
  ensure  => 'directory',
  recurse => true,
}->
ssh_keygen { 'george' :
  home    => '/tmp/george',
}
