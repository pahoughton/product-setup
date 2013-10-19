# test-03-ssh_keygen.pp - 2013-10-18 07:15
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
# A real manifest would use mode 0700
# 
user { 'george' :
  ensure  => 'present',
  home    => '/Users/george',
}->
file { '/Users/george' :
  ensure  => 'directory',
  mode    => '0755',
  ownwer  => 'george',
}->
file { '/Users/george/.ssh' :
  ensure  => 'directory',
  mode    => '0755',
  owner   => 'george',
}->
ssh_keygen { 'george' :
  home    => '/Users/george',
}
