# config.pp - 2013-10-18 06:43
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
# configure provider for tests - prepended to each test before run.
# 
Package {
  provider => $osfamily ? {
    Darwin  => macports,
    default => undef,
  }
}
